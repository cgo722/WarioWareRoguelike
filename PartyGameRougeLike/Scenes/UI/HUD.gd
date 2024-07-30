extends Control

@onready var gamemanager = get_node("/root/GameManager")
@onready var timer : Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_parent().get_parent().get_node("GameTimer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$"Health Amount Text".text = str(gamemanager.playerHealth)
	$"Timer Amount Text".text = str(snapped(timer.time_left, 0.01))
	$"Score Amount Text".text = str(gamemanager.score)
	pass
