extends CharacterBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var player = get_parent().get_parent().get_node("StandardCharacter3D")
@onready var gamemanager = get_node("/root/GameManager")
@onready var SPEED : float = 6.0 * gamemanager.otherSpeed3D
@onready var radius : float = 3.0
@onready var animT : AnimationTree = $CollisionShape3D/RoseBud/AnimationTree
var newDir : Vector3
@export var puffFX : PackedScene
var states : Array = ["Idle", "Running"]
var curState : String
var prevState : String
func _ready():
	position = Vector3(randf_range(-12, 12), 1, randf_range(-12, 12))
	$".".scale = Vector3(.75, .75, .75)
	curState = "Running"
func _physics_process(delta):
	$CollisionShape3D/RoseBud.rotation.y = Vector2(newDir.x, newDir.z).angle()
	if not is_on_floor():
		velocity.y -= gravity * delta
	if is_on_floor():
		velocity = newDir.normalized() * SPEED
	move_and_slide()
	
	

func _process(delta):
	Animationz()

func _on_area_3d_body_entered(body):
	gamemanager.completed = true
	gamemanager.score += 150
	var puffFXInstance = puffFX.instantiate()
	self.add_sibling(puffFXInstance)
	puffFXInstance.position = position
	self.queue_free()
	pass # Replace with function body.


func _on_timer_timeout():
	stateSwitch()
	pass # Replace with function body.

func stateSwitch():
	prevState = curState
	if prevState == "Idle":
		curState = "Running"
	else:
		curState = states.pick_random()
	if(curState == "Running"):
		newDir = Vector3(randf_range(-50,50), 0, randf_range(-50, 50))
		$Timer.wait_time = randf_range(2, 4)
	else:
		newDir = Vector3(0,0,0)
		$Timer.wait_time = randf_range(0.5, 1)
		
func Animationz():
	if(velocity.x > 0 && velocity.z > 0):
		animT["parameters/Blend2/blend_amount"] = 0
		if(velocity.y != 0):
			animT["parameters/Blend2/blend_amount"] += .1
	else:
		animT["parameters/Blend2/blend_amount"] = 1
