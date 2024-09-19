extends Sprite2D

@export var height : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.y = height
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
