extends Node2D

@onready var gamemanager = get_node("/root/GameManager")
@onready var maxCount : int = randi_range(1, 100)
var count : int
@onready var confettiPS : Array = [$Confetti, $Confetti2]
# Called when the node enters the scene tree for the first time.
func _ready():
	gamemanager.completed = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		count += 1
	if count > maxCount:
		gamemanager.completed = true
		for i in confettiPS:
			i.emitting = true
	pass
