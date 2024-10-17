extends Control

var contr : bool
@onready var label : Label = $Button/Label
@onready var gamemanager = get_node("/root/GameManager")

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		contr = false
	if event is InputEventJoypadButton:
		contr = true
func  _process(delta: float) -> void:
	if contr == false:
		label.text = "KEY_SKIP_K" + " " + str(gamemanager.skipCost) + " " + "KEY_FROM_SCORE"
	else:
		label.text = "KEY_SKIP_C" + " " + str(gamemanager.skipCost) + " " + "KEY_FROM_SCORE"
