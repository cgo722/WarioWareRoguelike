extends Control

@export var mainMenu : PackedScene 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_up() -> void:
	var sceneInstance = mainMenu.instantiate()
	get_parent().add_child(sceneInstance)
	self.queue_free()
	pass # Replace with function body.
