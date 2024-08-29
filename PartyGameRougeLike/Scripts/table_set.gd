extends Node3D

@onready var stoold = [$Stool, $Stool2, $Stool3, $Stool5]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in stoold.size():
		var stool = stoold[i]
		var chance : int = randi_range(0, 1)
		if chance == 1:
			stoold[i].visible = true
		else:
			stoold[i].visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
