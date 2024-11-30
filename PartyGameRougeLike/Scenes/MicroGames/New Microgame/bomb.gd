extends RigidBody3D
@onready var kdt_player: Node3D = $KdtPlayer

@export var speed : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = kdt_player.global_rotation_degrees
	apply_central_impulse(basis.z * speed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
