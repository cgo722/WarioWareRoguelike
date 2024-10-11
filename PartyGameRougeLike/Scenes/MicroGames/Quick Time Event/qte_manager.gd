extends Node2D

#@onready var gameTimer : Timer = get_parent().get_node("GameTimer")
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2

var go : bool
@export var waitTime : float
@export var failTime : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	go = false
	timer.start(waitTime)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		if go == false:
			print("you silly guy")
		else:
			print("nice job")
			
		pass
	pass


func _on_timer_timeout() -> void:
	go = true
	timer_2.start(failTime)
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	go = false
	pass # Replace with function body.
