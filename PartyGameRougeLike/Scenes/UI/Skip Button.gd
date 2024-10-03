extends Control

var contr : bool
@onready var label : Label = $Button/Label
var controllerText : String = "RB Skip cost 400"
@onready var gamemanager = get_node("/root/GameManager")

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		label.text = "KEY_SKIP_K" + str(gamemanager.skipCost) + "KEY_FROM_SCORE"
	if event is InputEventJoypadButton:
		label.text = "KEY_SKIP_C" + str(gamemanager.skipCost) + "KEY_FROM_SCORE"
