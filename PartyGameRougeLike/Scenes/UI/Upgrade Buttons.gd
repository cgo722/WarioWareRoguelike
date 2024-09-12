extends Node

@onready var gamemanager = get_node("/root/GameManager")
#@onready var postiveEffects = [gamemanager.playerSpeed3D, gamemanager.playerSpeed2D, gamemanager.roundLength,
#gamemanager.playerSize3D, gamemanager.playerHealth]

#@onready var negativeEffects = [gamemanager.otherSpeed3D, gamemanager.otherSpeed2D, gamemanager.roundLength,
#gamemanager.enemySize3D, gamemanager.unitNumbers]

@onready var effectNames := ["SpdU", "SpdURLD", "SpdUJFD", "RLU", "RLD", "RluSpdD", "PHU", "TR", "MSpdU", 
"MRLU", "MPHU", "JFUSpdD", "JFUOSpdU", "MJFU", "JpU"]

@onready var effect : String

@onready var button :=  $VBoxContainer/Button
@onready var descBox := $VBoxContainer/Button/Label
var buttonText : String
var descText : String
@onready var sprite_2d: Sprite2D = $VBoxContainer/Sprite2D

@onready var GameTimer : Timer = get_parent().get_parent().get_parent().get_node("GameTimer")
@onready var Sprites := ["res://Assets/UIpack/789_Lorc_RPG_icons/Icon.5_56.png","res://Assets/UIpack/789_Lorc_RPG_icons/Icon.1_72.png", 
"res://Assets/UIpack/789_Lorc_RPG_icons/Icon.5_63.png", "res://Assets/UIpack/789_Lorc_RPG_icons/Icon.4_04.png",
"res://Assets/UIpack/789_Lorc_RPG_icons/Icon.7_53.png", "res://Assets/UIpack/789_Lorc_RPG_icons/Icon.7_54.png",
"res://Assets/UIpack/789_Lorc_RPG_icons/Icon.7_64.png", "res://Assets/UIpack/789_Lorc_RPG_icons/Icon.4_97.png",
"res://Assets/UIpack/789_Lorc_RPG_icons/Icons8_66.png", "res://Assets/UIpack/789_Lorc_RPG_icons/Icon.4_29.png",
"res://Assets/UIpack/789_Lorc_RPG_icons/Icon.4_17.png", "res://Assets/UIpack/789_Lorc_RPG_icons/Icon.1_95.png",
"res://Assets/UIpack/789_Lorc_RPG_icons/Icon.4_33.png", "res://Assets/UIpack/789_Lorc_RPG_icons/Icon.4_35.png",
"res://Assets/UIpack/789_Lorc_RPG_icons/Icon.4_64.png"]

# Called when the node enters the scene tree for the first time.
func _ready():
	effect = effectNames.pick_random()
	if effect == "SpdU":
		buttonText = "KEY_SPDU"
		descText = "DESC_SPDU"
		sprite_2d.texture = load(Sprites[0])
	if effect == "SpdURLD":
		buttonText = "KEY_SPDURLD"
		descText = "DESC_SPDURLD"
		sprite_2d.texture = load(Sprites[1])
	if effect == "SpdUJFD":
		buttonText = "KEY_SPDUJFD"
		descText = "DESC_SPDUJFD"
		sprite_2d.texture = load(Sprites[2])
	if effect == "RLU":
		buttonText = "KEY_RLU"
		descText = "DESC_RLU"
		sprite_2d.texture = load(Sprites[3])
	if effect == "RLD":
		buttonText = "KEY_RLD"
		descText = "DESC_RLD"
		sprite_2d.texture = load(Sprites[4])
	if effect == "RluSpdD":
		buttonText = "KEY_RLUSPDD"
		descText = "DESC_RLUSPDD"
		sprite_2d.texture = load(Sprites[5])
	if effect == "PHU":
		buttonText = "KEY_PHU"
		descText = "DESC_PHU"
		sprite_2d.texture = load(Sprites[6])
	if effect == "TR":
		buttonText = "KEY_TR"
		descText = "DESC_TR"
		sprite_2d.texture = load(Sprites[7])
	if effect == "MSpdU":
		buttonText = "KEY_MSPDU"
		descText = "DESC_MSPDU"
		sprite_2d.texture = load(Sprites[8])
	if effect == "MRLU":
		buttonText = "KEY_MRLU"
		descText = "DESC_MRLU"
		sprite_2d.texture = load(Sprites[9])
	if effect == "MPHU":
		buttonText = "KEY_MPHU"
		descText = "DESC_MPHU"
		sprite_2d.texture = load(Sprites[10])
	if effect == "JFUSpdD":
		buttonText = "KEY_JFUSPDD"
		descText = "DESC_JFUSPDD"
		sprite_2d.texture = load(Sprites[11])
	if effect == "JFUOSpdU":
		buttonText = "KEY_JFUOSPDU"
		descText = "DESC_JFUOSPDU"
		sprite_2d.texture = load(Sprites[12])
	if effect == "MJFU":
		buttonText = "KEY_MJFU"
		descText = "DESC_MJFU"
		sprite_2d.texture = load(Sprites[13])
	if effect == "JpU":
		buttonText = "KEY_JPU"
		descText = "DESC_JPU"
		sprite_2d.texture = load(Sprites[14])
	button.text = buttonText
	descBox.text = descText
	pass # Replace with function body.

func _process(delta):
	if gamemanager.playerHealth <= 1 && effect == "MSpdU" or "MRLU" or "MPHU" or "MJFU":
		effect = effectNames.pick_random()

func _on_button_button_up():
	print("Your mom")
	gamemanager.upgrades = true
	if effect == "SpdU":
		gamemanager.playerSpeed3D += 0.05
		gamemanager.playerSpeed2D += 0.05
	if effect == "SpdURLD":
		gamemanager.playerSpeed3D += 0.15
		gamemanager.playerSpeed2D += 0.15
		
		gamemanager.roundLength -= 0.25

	if effect == "SpdUJFD":
		gamemanager.playerSpeed3D += 0.15
		gamemanager.playerSpeed2D += 0.15
		
		gamemanager.jumpStrength -= 0.2
	if effect == "RluSpd":
		gamemanager.roundLength += 0.25
		
		gamemanager.playerSpeed3D -= 0.25
		gamemanager.playerSpeed2D -= 0.25
	if effect == "RLU":
		gamemanager.roundLength += 0.05
	if effect == "RLD":
		gamemanager.roundLength -= 0.05
	if effect == "PHU":
		gamemanager.playerHealth += 1
		
		gamemanager.otherSpeed3D += 0.15
		gamemanager.otherSpeed2D += 0.15

		
	if effect == "TR":
		GameTimer.wait_time = 15
		
		gamemanager.playerHealth -= 1
		
	if effect == "MSpdU":
		gamemanager.playerSpeed3D += 0.5
		gamemanager.playerSpeed2D += 0.5
		
		gamemanager.playerHealth -= 1
		
	if effect == "MRLU":
		gamemanager.roundLength += 1
		
		gamemanager.playerHealth -= 1
		
	if effect == "MPHU":
		gamemanager.playerHealth += 2
		
		gamemanager.roundLength -= 0.75
		
	if effect == "JFUSpdD":
		gamemanager.jumpStrength += 0.2
		
		gamemanager.playerSpeed3D -= 0.25
		gamemanager.playerSpeed2D -= 0.25
		
	if effect == "JFUOSpdU":
		gamemanager.jumpStrength += 0.25
		
		gamemanager.otherSpeed3D += 0.15
		gamemanager.otherSpeed2D += 0.15
	if effect == "MJFU":
		gamemanager.jumpStrength += 0.5
		
		gamemanager.playerHealth -= 1
		
	if effect == "JpU":
		gamemanager.jumpStrength += 0.05
	get_tree().paused = false
	pass # Replace with function body.

func _exit_tree():
	var UiPlayuer = get_parent().get_parent().get_parent().get_node("UISFX")
	UiPlayuer.play()
