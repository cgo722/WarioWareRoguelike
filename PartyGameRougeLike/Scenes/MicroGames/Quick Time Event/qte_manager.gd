extends Node2D

var gameTimer : Timer
@onready var timer: Timer = $Timer
var go : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	go = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		pass
	pass
