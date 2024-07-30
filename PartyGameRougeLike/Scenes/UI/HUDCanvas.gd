extends CanvasLayer

@onready var gamemanager = get_node("/root/GameManager")
@onready var hud = load("res://Scenes/UI/HUD.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(gamemanager.start)
	if gamemanager.start == true:
		var hud_instance = hud.instantiate()
		self.add_child(hud_instance)
	pass
