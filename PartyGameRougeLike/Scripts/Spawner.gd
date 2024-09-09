extends Node

@onready var pickup = load("res://Assets/3DInteractable.tscn")

@onready var gamemanager = get_node("/root/GameManager")
# Called when the node enters the scene tree for the first time.
func _ready():
	var spawn_instance = pickup.instantiate()
	self.add_child(spawn_instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
