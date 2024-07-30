extends Node2D

var count : int
@onready var fish = load("res://Assets/FishingAssets/Fish.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	while count < 50:
		var spawn_instance = fish.instantiate()
		self.add_child(spawn_instance)
		count += 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
