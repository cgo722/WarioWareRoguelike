extends Node3D

@onready var camera_3d: Camera3D = $Camera3D
@export var speed : float
@export var shotSpeed : float
@export var bullet : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var directionY = Input.get_axis("ui_down", "ui_up")
	var directionX = Input.get_axis("ui_left", "ui_right")
	if directionY:
		rotation.x += (directionY * speed)
	if directionX:
		rotation.y += (directionX * -speed)
	if Input.is_action_just_pressed("jump"):
		var bulletInstance = bullet.instantiate()
		get_parent().add_child(bulletInstance)
		bulletInstance.position = camera_3d.global_position
		bulletInstance.rotation = rotation

		pass
	pass
