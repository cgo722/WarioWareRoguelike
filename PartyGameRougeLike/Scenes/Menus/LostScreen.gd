extends Control

@onready var MainMenu = load("res://Scenes/Menus/MainMenu.tscn")
@onready var gamemanager = get_node("/root/GameManager")
var useable : bool
@onready var savingResource : SavingResource = SavingResource.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	useable = false
	if gamemanager.score > gamemanager.hiScore:
		gamemanager.hiScore = gamemanager.score
		savingResource.HiScore = gamemanager.hiScore
		savingResource.saveData()
	get_tree().paused = true
	pass # Replace with function body.

func _on_main_menu_button_up():
	if useable == true: 
		gamemanager.score = 0
		gamemanager.playerHealth = 3
		gamemanager._reset()
		get_tree().reload_current_scene()
		var scene_instance = MainMenu.instantiate()
		get_parent().add_child(scene_instance)
		queue_free()
	pass # Replace with function body.


func _on_resume_button_up() -> void:
	get_tree().paused = false
	self.queue_free()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	useable = true
	pass # Replace with function body.


func _on_lost_timer_timeout() -> void:
	useable = true
	pass # Replace with function body.
