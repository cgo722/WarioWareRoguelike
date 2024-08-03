extends GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.emitting = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	self.queue_free()
	pass # Replace with function body.
