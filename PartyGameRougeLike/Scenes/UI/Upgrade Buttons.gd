extends Node

@onready var gamemanager = get_node("/root/GameManager")
#@onready var postiveEffects = [gamemanager.playerSpeed3D, gamemanager.playerSpeed2D, gamemanager.roundLength,
#gamemanager.playerSize3D, gamemanager.playerHealth]

#@onready var negativeEffects = [gamemanager.otherSpeed3D, gamemanager.otherSpeed2D, gamemanager.roundLength,
#gamemanager.enemySize3D, gamemanager.unitNumbers]

@onready var effectNames = ["SpdU", "SpdURLD", "SpdUJFD", "RLU", "RLD", "RluSpdD", "PHU", "TR", "MSpdU", 
"MRLU", "MPHU", "JFUSpdD", "JFUOSpdU", "MJFU", "JpU"]

@onready var effect

@onready var button = $Button 
@onready var descBox = $Button/Label
var buttonText : String
var descText : String

@onready var GameTimer : Timer = get_parent().get_parent().get_parent().get_node("GameTimer")


# Called when the node enters the scene tree for the first time.
func _ready():
	effect = effectNames.pick_random()
	if effect == "SpdU":
		buttonText = "New Shoes"
		descText = "Your new kicks give a 5% increase in your running speed"
	if effect == "SpdURLD":
		buttonText = "Adernaline"
		descText = "Player Speed +15% and Round Length -25%"
	if effect == "SpdUJFD":
		buttonText = "Skipped Leg Day"
		descText = "Do to running more instead of doing your squats your speed has increased by +15% but you Jump height is -20%"
		
	if effect == "RLU":
		buttonText = "Sun Dial"
		descText = "This rudimentary device gives a 5% increase to timer length"
		
	if effect == "RLD":
		buttonText = "Broken Hour Glass"
		descText = "This broken device gives a 5% decrease to timer length"
	if effect == "RluSpdD":
		buttonText = "Hour Glass"
		descText = "Round Length +25% and Player Speed -25%"
	if effect == "PHU":
		buttonText = "1 Up"
		descText = "1 Extra Life and +15% speed to everything but the player"
	if effect == "TR":
		buttonText = "StopWatch"
		descText = "This resets the timer back to 15 seconds at the cost of one life"
		
	if effect == "MSpdU":
		buttonText = "Bottled Wind"
		descText = "At a cost of one life you can increase your speed by +50%"
		
	if effect == "MRLU":
		buttonText = "Grandfather Clock"
		descText = "At the cost of one life you can increase the time in a round by +100%"
		
	if effect == "MPHU":
		buttonText = "Mega 1 UP"
		descText = "At a Significant cost of 75% of the round timer you get two lives"
		
	if effect == "JFUSpdD":
		buttonText = "Spring Boots"
		descText = "+20% increase to your spacebar button at the cost of -25% speed"
	if effect == "JFUOSpdU":
		buttonText = "Leg Day"
		descText = "Because of not skipping leg day your jump is increased by +25% but others are faster than you by -15%"
	if effect == "MJFU":
		buttonText = "Rocket Boots"
		descText = "+50% to the power of the Spacebar button at the cost of one life"
		
	if effect == "JpU":
		buttonText = "Squats"
		descText = "5% increase to jump height"
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
		gamemanager.jumpStrength = 0.05
	get_tree().paused = false
	pass # Replace with function body.

func _exit_tree():
	var UiPlayuer = get_parent().get_parent().get_parent().get_node("UISFX")
	UiPlayuer.play()
