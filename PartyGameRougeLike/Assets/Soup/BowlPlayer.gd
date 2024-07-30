extends Node3D
@onready var gamemanager = get_node("/root/GameManager")
@onready var SPEED : float = 0.01 * gamemanager.playerSpeed3D
var minT : float 
var maxT : float
var rotationDir : Vector3
@onready var timer = $Timer
@onready var splashParticles = $Splash_part
# Called when the node enters the scene tree for the first time.
func _ready():
	minT = -0.001
	maxT = 0.001
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.y, 0, -input_dir.x)).normalized()
	rotation += rotationDir
	rotation += direction * SPEED
	
	pass


func _on_timer_timeout():
	rotationDir = Vector3(randf_range(minT, maxT), 0, randf_range(minT, maxT))
	timer.wait_time -= 0.1 * gamemanager.otherSpeed3D
	pass # Replace with function body.


func _on_round_timer_timeout():
	minT -= 0.002
	maxT += 0.002
	pass # Replace with function body.


func _on_area_3d_body_entered(_body):
	splashParticles.emitting = true
	pass # Replace with function body.
