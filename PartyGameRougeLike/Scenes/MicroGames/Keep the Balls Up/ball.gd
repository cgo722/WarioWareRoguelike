extends RigidBody2D

@onready var gamemanager := get_node("/root/GameManager")

@export var min : float
@onready var speed : float = 1000 * gamemanager.otherSpeed2D
var vel : float = 750
var down : bool
var ballCount : int = 0
@export var scoreIncrease : float
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
			
	if position.y > min:
		self.queue_free()
	pass
	


func _on_body_entered(body: Node) -> void:
	apply_central_impulse(Vector2(randf_range(-350,350), 0))
	down = not down
	gamemanager.score += scoreIncrease
	pass # Replace with function body.


func _on_tree_exiting() -> void:
	gamemanager.ballNumbers += 1
	pass # Replace with function body.
