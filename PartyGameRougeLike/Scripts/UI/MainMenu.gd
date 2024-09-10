extends Control

@onready var gamemanager = get_node("/root/GameManager")
@onready var settingsMenu = load("res://Scenes/Menus/Settings.tscn")
@onready var hsAmount : Label = $"BoxContainer/HBoxContainer/VBoxContainer/HSplitContainer/High Score Amount"
@onready var howToMenu = load("res://Scenes/Menus/How To Screen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	if ResourceLoader.exists("user://SaveData.res"):
		hsAmount.text = str(gamemanager.savingResource.HiScore)
	else:
		hsAmount.text = "0"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_options_button_up():
	var sceneInstance = settingsMenu.instantiate()
	get_parent().add_child(sceneInstance)
	self.queue_free()
	pass # Replace with function body.


func _on_quit_button_up():
	get_tree().quit()
	pass # Replace with function body.


func _on_play_button_up():
	gamemanager.start = true
	self.queue_free()
	pass # Replace with function body.

func _exit_tree():
	var UiPlayuer = get_parent().get_node("UISFX")
	UiPlayuer.play()


func _on_how_to_button_up() -> void:
	var sceneInstance = howToMenu.instantiate()
	get_parent().add_child(sceneInstance)
	self.queue_free()
	pass # Replace with function body.
