extends AnimatableBody2D

@onready var gamemanager := get_node("/root/GameManager")

@onready var speed : float = 15 * gamemanager.playerSpeed2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#speed *= gamemanager.playerSpeed2d
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir = Input.get_axis("ui_left", "ui_right")
	if dir != 0:
		position.x += (dir * speed)
	else:
		dir = 0
	pass
