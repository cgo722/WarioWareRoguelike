extends Control

var contr : bool
@onready var label : Label = $Button/Label
var controllerText : String = "RB Skip cost 400"
@onready var gamemanager = get_node("/root/GameManager")

func _process(delta):
	label.text = "skip: -" + str(gamemanager.skipCost) + " from Score"
