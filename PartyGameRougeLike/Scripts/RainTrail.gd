extends Line2D

var queue : Array
@export var maxLength : int
@export var length : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var pos = get_parent().global_position
	
	queue.push_front(pos)
	if queue.size() > maxLength:
		queue.pop_back()
	
	if length == true:
		clear_points()
	
	for point in queue:
		add_point(point)
	pass
