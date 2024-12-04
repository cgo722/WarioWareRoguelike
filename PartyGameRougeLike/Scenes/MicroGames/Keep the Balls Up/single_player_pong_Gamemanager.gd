extends Node2D

@onready var gamemanager := get_node("/root/GameManager")

@export var balls : PackedScene
@export var startLocale : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var ballinstance = balls.instantiate()
	add_child(ballinstance)
	ballinstance.position = startLocale
	pass # Replace with function body.
