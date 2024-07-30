extends Node3D

var outCome : int 
@export var randChance : int 
@onready var rb : RigidBody3D = $RigidBody3D
# Called when the node enters the scene tree for the first time.
func _ready():
	
	rb.freeze = true
	pass # Replace with function body.

func _on_timer_timeout():
	outCome = randi() % randChance
	if outCome < randChance * 0.1:
		rb.freeze = false
	pass # Replace with function body.
