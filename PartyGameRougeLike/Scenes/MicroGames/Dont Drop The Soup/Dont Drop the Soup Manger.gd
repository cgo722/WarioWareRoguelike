extends Node3D

@onready var gamemanager = get_node("/root/GameManager")
@onready var timer = $Timer
@onready var count = 0
@onready var leftOver : int = 60
@onready var game_timer: Timer = get_parent().get_node("GameTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(game_timer.wait_time - 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(timer.wait_time)
	
	pass


func _on_area_3d_body_entered(_body):
	if count >= 3:
		gamemanager.completed = false
		gamemanager.death = true
	else:
		gamemanager.score -= 50
		count += 1
		leftOver -= 1
	pass # Replace with function body.


func _on_timer_timeout():
	if gamemanager.death != true:
		gamemanager.completed = true
		gamemanager.score += (5 * leftOver)
	else :
		gamemanager.completed = false
	pass # Replace with function body.


func _on_instruction_t_imer_timeout():
	$CanvasLayer.queue_free()
	pass # Replace with function body.
