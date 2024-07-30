extends Node3D

var count : int
@onready var broth = load("res://Assets/Soup/Broth.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	count = 1
	while count < 1000:
		var spawn_instance = broth.instantiate()
		self.add_child(spawn_instance)
		count += 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
