extends RigidBody3D

@export var speed : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_central_impulse(basis.z * -speed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
