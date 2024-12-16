extends Node2D
@onready var gamemanager = get_node("/root/GameManager")
@export var maxCount : int
var count : int
@onready var fish = load("res://Assets/FishingAssets/Fish.tscn")
@onready var paralaxLayers = [$"../Background",$"../MiddleGround",
 $"../Foreground", $"../WavesBackground", $"../Waves Foreground"]
# Called when the node enters the scene tree for the first time.
func _ready():
	maxCount *= gamemanager.frequency
	while count < maxCount:
		var spawn_instance = fish.instantiate()
		paralaxLayers.pick_random().add_child(spawn_instance)
		count += 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
