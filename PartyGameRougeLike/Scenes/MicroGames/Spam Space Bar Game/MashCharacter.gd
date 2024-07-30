extends Node2D

@onready var gamemanager = get_node("/root/GameManager")
@onready var maxCount : int = randi_range(1, 100)
var count : int
# Called when the node enters the scene tree for the first time.
func _ready():
	gamemanager.completed = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		count += roundi(1 * gamemanager.jumpStrength)
	if count > maxCount:
		gamemanager.completed = true
	pass
