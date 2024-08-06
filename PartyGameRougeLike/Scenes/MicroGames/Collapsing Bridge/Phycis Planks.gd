extends Node3D

@onready var gamemanager := get_node("/root/GameManager")

var outCome : int 
@export var randChance : int 
@onready var rb : RigidBody3D = $RigidBody3D
@onready var shaker := $RigidBody3D/Plank/ShakerComponent3D
var shaken : bool
var scored : bool = false
@export var value : float = 45
# Called when the node enters the scene tree for the first time.
func _ready():
	shaken = false
	rb.freeze = true
	pass # Replace with function body.

func _process(delta):
	if self.position.y < -10 && scored == false && $"../StandardCharacter3D".position < -10:
		gamemanager.score += value
		scored == true

func _on_timer_timeout():
	outCome = randi() % randChance
	if outCome < randChance * 0.1:
		shaker.play_shake()
	pass # Replace with function body.


func _on_shaker_component_3d_shake_finished():
	rb.freeze = false
	pass # Replace with function body.
