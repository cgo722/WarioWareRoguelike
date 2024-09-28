extends Control

@onready var gamemanager = get_node("/root/GameManager")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if gamemanager.playerHealth < 1 or gamemanager.upgrades == true:
		queue_free()
	pass
