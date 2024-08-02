extends CharacterBody2D

@onready var gamemanager := get_node("/root/GameManager")
@onready var SPEED : float = 300.0 * gamemanager.playerSpeed2D
@onready var pwrBar : TextureProgressBar = $TextureProgressBar
var depth : float
@export var pwrStr : float = 10
var fishing : bool
var animationPlayed : bool = false

@onready var fishDeathPS := load("res://Assets/FishingAssets/FishDeath.tscn")
@onready var splashPS := load("res://Assets/FishingAssets/Splash.tscn")
@onready var fisherman := $"../FishermanSprite"

# Get the gravity from the project settings to be synced with RigidBody nodes.

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	fishing = false

	
func _physics_process(delta):
	
	pwrBar.value = depth
	if Input.is_action_pressed("jump") && fishing == false:
		depth += (pwrStr * gamemanager.jumpStrength)
		if animationPlayed == false:
			fisherman.play("Reel")
			animationPlayed = true
		pass
		
	if Input.is_action_just_released("jump") && fishing == false:
		velocity.y = depth
		depth = 0
		fishing = true
		fisherman.play("Cast")
		animationPlayed = false

	if fishing == true:
		velocity.y += (-gravity * delta) * .5
		
	if position.y < -20:
		fishing = false
	else:
		fishing = true
	clampf(depth, 0 , 5000)

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction && fishing == true:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_area_2d_body_entered(body):
	var PSInstance = fishDeathPS.instantiate()
	get_parent().add_child(PSInstance)
	PSInstance.position = position
	pass # Replace with function body.

func _on_area_2d_body_exited(body):
	var PSInstance = splashPS.instantiate()
	get_parent().add_child(PSInstance)
	PSInstance.position = position
	pass # Replace with function body.
