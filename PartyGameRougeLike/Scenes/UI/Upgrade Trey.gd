extends Control

@onready var gamemanager = get_node("/root/GameManager")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if gamemanager.upgrades == true or gamemanager.health < 1:
		queue_free()
	pass
