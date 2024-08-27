extends Sprite2D

@export var speed : float
@export var minX : float
@export var maxX : float
@onready var player := $"../StandardPlayer"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x < minX :
		speed *= -1
	if position.x > maxX:
		speed *= -1
	
	position.x += speed
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	player.queue_free()
	print("I killed you")
	pass # Replace with function body.
