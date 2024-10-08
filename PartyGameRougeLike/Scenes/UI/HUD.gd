extends Control

@onready var gamemanager = get_node("/root/GameManager")
@onready var timer : Timer
@onready var stats := [$Panel/VBoxContainer/HSplitContainer/Label2, $Panel/VBoxContainer/HSplitContainer2/Label3,
$Panel/VBoxContainer/HSplitContainer3/Label5, $Panel/VBoxContainer/HSplitContainer4/Label6, $Panel/VBoxContainer/HSplitContainer5/Label7, $Panel/VBoxContainer/HSplitContainer6/Label7]
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_parent().get_parent().get_node("GameTimer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$"HBoxContainer/HSplitContainer/Health Amount Text".text = str(gamemanager.playerHealth)
	$"HBoxContainer/HSplitContainer2/Timer Amount Text".text = str(snapped(timer.time_left, 0.01))
	$"HBoxContainer/HSplitContainer3/Score Amount Text".text = str(gamemanager.score)
	stats[0].text = str(gamemanager.playerSpeed3D)
	stats[1].text = str(gamemanager.playerSpeed2D)
	stats[2].text = str(gamemanager.jumpStrength)
	stats[3].text = str(gamemanager.otherSpeed3D)
	stats[4].text = str(gamemanager.otherSpeed2D)
	stats[5].text = str(gamemanager.roundLength)
	pass
