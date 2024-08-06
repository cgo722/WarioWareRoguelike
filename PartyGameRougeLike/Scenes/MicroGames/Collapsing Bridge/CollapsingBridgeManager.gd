extends Node3D

@onready var gamemanager := get_node("/root/GameManager")
@onready var player := $StandardCharacter3D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.position.y < - 10:
		gamemanager.completed = false
		gamemanager.death = true
	pass
