extends Control

var contr : bool
@onready var label : Label = $Button/Label
var controllerText : String = "RB Skip cost 400"
@onready var gamemanager = get_node("/root/GameManager")

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		label.text = "Press R: skip -" + str(gamemanager.skipCost) + " from Score"
	if event is InputEventJoypadButton:
		label.text = "Press RB: skip -" + str(gamemanager.skipCost) + " from Score"
