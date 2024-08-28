extends Sprite2D

@export var speed : float
var curSpeed : float
@export var minX : float
@export var maxX : float
@onready var player := $"../StandardPlayer"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x < minX :
		speed *= randf_range(0.1, 2)
		speed *= -1
		flip_h = true
	if position.x > maxX:
		speed *= randf_range(0.1, 2)
		flip_h = false
	
	clampf(curSpeed, -20, 20)
	curSpeed = speed
	position.x += curSpeed
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	player.queue_free()
	pass # Replace with function body.
