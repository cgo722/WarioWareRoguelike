extends Node3D


@onready var gamemanager = get_node("/root/GameManager")
# Called when the node enters the scene tree for the first time.
func _ready():
	gamemanager.completed = false
	gamemanager.threeD = true
	gamemanager.twoD = false
	pass # Replace with function body.


func _on_instruction_timer_timeout():
	$CanvasLayer.queue_free()
	pass # Replace with function body.
