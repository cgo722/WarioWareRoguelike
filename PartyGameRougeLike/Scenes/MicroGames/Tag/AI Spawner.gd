extends Node3D

@onready var AI = load("res://Assets/AI/Tag_AI.tscn")

@onready var gamemanager = get_node("/root/GameManager")

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ai_spawner_timer_timeout():
	var spawn_instance = AI.instantiate()
	self.add_child(spawn_instance)
	$"AI Spawner Timer".wait_time += (.2 * gamemanager.frequency)
