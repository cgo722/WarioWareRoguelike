extends Sprite2D

@onready var gamemanager := get_node("/root/GameManager")

@onready var SwordArt := ["res://Assets/Sword and the Stone/IMG_0413.png", "res://Assets/Sword and the Stone/IMG_0414.png"]
@export var competedHeight : float
var startHeight : float
@export var pullOutSpeed : float
var falling : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	SwordArt.pick_random()
	startHeight = position.y
	#pullOutSpeed *= gamemanager.playerSpeed2D
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("jump"):
		falling = false
		self.position.y -= pullOutSpeed
	else:
		falling = true
	if position.y < startHeight && falling == true:
		self.position.y += pullOutSpeed
	
	pass
