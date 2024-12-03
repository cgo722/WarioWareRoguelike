extends RigidBody2D

var speed : float = 1000
var vel : float = 750
var down : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	down = true
	#angular_velocity = randf_range(-180, 180)
	apply_central_impulse(Vector2(0,speed))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if down == true:
		if linear_velocity.y < vel:
			apply_central_force(Vector2(0,speed))
	else:
		if linear_velocity.y > -vel:
			apply_central_force(Vector2(0,-speed))
	pass
	


func _on_body_entered(body: Node) -> void:
	apply_central_impulse(Vector2(randf_range(-350,350), 0))
	down = not down
	pass # Replace with function body.
