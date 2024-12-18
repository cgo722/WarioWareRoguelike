extends Control
signal scoreChange
signal pof
@onready var gamemanager = get_node("/root/GameManager")
@onready var timer : Timer
@export var VFX := []
var oldscore : float = 0
@onready var pfl: Sprite2D = $CanvasLayer/PassOrFailLIght
@onready var wavyTexture := load("res://Assets/Materials/Wavy UI.gdshader")
@export var lights := ["res://Assets/UIpack/Red Light.png", "res://Assets/UIpack/Green Light.png"]
@onready var stats := [$Panel/VBoxContainer/HSplitContainer/Label2, $Panel/VBoxContainer/HSplitContainer2/Label3,
$Panel/VBoxContainer/HSplitContainer3/Label5, $Panel/VBoxContainer/HSplitContainer4/Label6, 
$Panel/VBoxContainer/HSplitContainer5/Label7, $Panel/VBoxContainer/HSplitContainer6/Label7,
$Panel/VBoxContainer/HSplitContainer7/Label7]
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
	stats[6].text = str(gamemanager.frequency)
	if gamemanager.score != oldscore:
		#$"HBoxContainer/HSplitContainer3/Score Text".material.set_shader_param("height", 50)
		print("69")
		oldscore = gamemanager.score
		emit_signal("scoreChange")
	if gamemanager.completed == false:
		pfl.texture = load(lights[0])
	if gamemanager.completed == true:
		pfl.texture = load(lights[1])
		emit_signal("pof")
	pass


func _on_timer_timeout() -> void:
	
	pass # Replace with function body.
