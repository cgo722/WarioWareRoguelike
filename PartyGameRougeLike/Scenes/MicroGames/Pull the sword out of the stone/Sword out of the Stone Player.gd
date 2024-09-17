extends Sprite2D

@onready var gamemanager := get_node("/root/GameManager")

@onready var SwordArt := ["res://Assets/Sword and the Stone/IMG_0413.png", "res://Assets/Sword and the Stone/IMG_0414.png"]
@export var competedHeight : float
var startHeight : float
var baseSpeed : float
@export var pullOutSpeed : float
@export var fallSpeed : float
var falling : bool
@onready var shaker := $ShakerComponent2D
var scored : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pullOutSpeed *= gamemanager.playerSpeed2D
	fallSpeed *= gamemanager.otherSpeed2D
	SwordArt.pick_random()
	startHeight = position.y
	baseSpeed = pullOutSpeed
	scored = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("jump"):
		self.position.y -= pullOutSpeed
	else:
		pullOutSpeed = baseSpeed
	if position.y < competedHeight:
		gamemanager.finished = true
	if falling == true:
		position.y += fallSpeed
	if position.y > startHeight:
		falling = false
		position.y = startHeight
	else:
		falling = true
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		pullOutSpeed += 0.5
		shaker.play_shake()
	if gamemanager.finished == true && scored == false:
		gamemanager.score += 500
		scored = true
	pass


func _on_instruction_timer_timeout():
	$"../CanvasLayer".queue_free()
	pass # Replace with function body.
