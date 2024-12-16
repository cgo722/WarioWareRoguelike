extends Node2D

@onready var projectile = load("res://Assets/2D projectile.tscn")

@onready var gamemanager = get_node("/root/GameManager")
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	#if gamemanager.twoD == true:
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	var spawn_instance = projectile.instantiate()
	self.add_child(spawn_instance)
	timer.wait_time = randf_range(0.1 * gamemanager.frequency, 0.5 * gamemanager.frequency)
	pass # Replace with function body.
