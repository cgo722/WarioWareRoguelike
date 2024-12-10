extends Node
class_name sceneChanger
@onready var DemoLevels := ["res://Scenes/MicroGames/SurviveTheRain.tscn", "res://Scenes/MicroGames/CollectItem3D.tscn", 
"res://Scenes/MicroGames/Tag3D.tscn", "res://Scenes/MicroGames/Fishing/Fishing.tscn",
"res://Scenes/MicroGames/Dont Drop The Soup/Dont Drop the Soup.tscn"]
@onready var FullGameLevels := ["res://Scenes/MicroGames/SurviveTheRain.tscn", "res://Scenes/MicroGames/CollectItem3D.tscn", 
"res://Scenes/MicroGames/Tag3D.tscn", "res://Scenes/MicroGames/Fishing/Fishing.tscn",
"res://Scenes/MicroGames/Dont Drop The Soup/Dont Drop the Soup.tscn", "res://Scenes/MicroGames/Collapsing Bridge/CollapsingBridge.tscn",
"res://Scenes/MicroGames/Spam Space Bar Game/SpamSpaceBarGame.tscn", "res://Scenes/MicroGames/Pull the sword out of the stone/Pull the sword out of the Stone.tscn",
"res://Scenes/MicroGames/Keep the Balls Up/SinglePlayerPong.tscn"]
@export var demo : bool
@export var debug : bool
@export var mobile : bool
var Bag := []
var loadedLevel
var previousLevel
var scene_instance
@onready var gameTimer := $GameTimer
@onready var gamemanager := get_node("/root/GameManager")
@onready var hud : = load("res://Scenes/UI/HUD.tscn")
@onready var upgrades := load("res://Scenes/UI/Upgrade Trey.tscn")
@onready var skipButton := load("res://Scenes/UI/Skip Button.tscn")
@onready var pauseMenu := load("res://Scenes/Menus/PauseMenu.tscn")
var pauseable : bool
@onready var UIPlayer := $UISFX
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if demo == true:
		Bag += DemoLevels
	else:
		Bag += FullGameLevels
	if mobile == true:
		pass
	gamemanager.start = false
	if(gamemanager.restart != true):
		loadedLevel = load("res://Scenes/Menus/MainMenu.tscn")
		scene_instance = loadedLevel.instantiate()
		self.add_child(scene_instance)
		pauseable = false
	else:
		gamemanager.start = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if gamemanager.start == true:
		pauseable = true
	if Input.is_action_just_pressed("Pause") && pauseable == true:
		var pauseMenuInstance = pauseMenu.instantiate()
		$HUDCanvas.add_child(pauseMenuInstance)
	if Input.is_action_just_pressed("Skip") && gamemanager.score > gamemanager.skipCost:
		gamemanager.score -= gamemanager.skipCost
		gamemanager.skipCost += 100
		SceneManager(false)

	if gamemanager.death == true or gamemanager.finished == true: 
		SceneManager(false)

	if gamemanager.playerHealth > 0:
		if gamemanager.start == true:
			var hud_instance = hud.instantiate()
			$HUDCanvas.add_child(hud_instance)
			var skipButtonInstance = skipButton.instantiate()
			$HUDCanvas.add_child(skipButtonInstance)
			SceneManager(true)
			gameTimer.start()
			gamemanager.start = false
			
	else:
		DeathScreen()

func _on_timer_timeout():
	if gamemanager.playerHealth > 0:
		SceneManager(false)
 
func NewScene():
	var levelSel = randi_range(0, Bag.size()- 1)
	var loadlevel = ResourceLoader.load_threaded_request(Bag[levelSel])
	loadedLevel = ResourceLoader.load_threaded_get(Bag[levelSel])
	if Bag.size() <= 1:
		if demo == true:
			Bag += DemoLevels
		else:
			Bag += FullGameLevels
	Bag.remove_at(levelSel)

func SceneManager(loaded):
	if loaded == true:
		gamemanager.completed = false
		gamemanager.death = false
		gamemanager.finished = false
		NewScene()
		scene_instance = loadedLevel.instantiate()
		self.add_child(scene_instance)

	if loaded == false:
		gameTimer.start(15 * gamemanager.roundLength)
		gamemanager.finished = false
		if gamemanager.completed == false:
			gamemanager.playerHealth -= 1
		if gamemanager.playerHealth > 0:
			UpgradeButtons()
		scene_instance.queue_free()
		SceneManager(true)

func UpgradeButtons(): 
	if gamemanager.playerHealth > 0:
		gamemanager.upgrades = false 
		var upgrade_instance = upgrades.instantiate()
		$HUDCanvas.add_child(upgrade_instance)
		get_tree().paused = true
	pass
	
func DeathScreen():
	gameTimer.set_paused(true)
	gamemanager.playerHealth = 0
	SceneManager(false)
	loadedLevel = load("res://Scenes/Menus/LostScreen.tscn")
	scene_instance = loadedLevel.instantiate()
	self.add_child(scene_instance)
