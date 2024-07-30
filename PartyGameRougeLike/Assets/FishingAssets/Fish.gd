extends Node2D

var direction: float
@onready var gamemanager = get_node("/root/GameManager")
@onready var speed : float = 1 * gamemanager.otherSpeed2D
@onready var fishDeathPS = load("res://Assets/FishingAssets/FishDeath.tscn")
@onready var anim = $Area2D/CollisionShape2D/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(randf_range(-1500, 1500), randf_range(20, 5300))
	direction = randf_range(-5, 5)
	if(direction < 0):
		anim.flip_h = true
	else: if (direction > 0):
		anim.flip_h = false
		
	anim.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_local_x(direction * speed, true)
	pass


func _on_area_2d_body_entered(body):
	var PSInstance = fishDeathPS.instantiate()
	get_parent().add_child(PSInstance)
	PSInstance.position = position
	queue_free()
	gamemanager.completed = true
	gamemanager.score += 100
	pass # Replace with function body.


func _on_timer_timeout():
	direction = randf_range(-5, 5)
	if(direction < 0):
		anim.flip_h = true
	else: if (direction > 0):
		anim.flip_h = false
	$Timer.wait_time = randf_range(0.5, 4)
	pass # Replace with function body.
