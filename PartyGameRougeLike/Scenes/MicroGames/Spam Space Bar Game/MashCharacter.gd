extends Node2D

@onready var gamemanager = get_node("/root/GameManager")
@onready var maxCount : int = randi_range(1, 100)
var count : int
@onready var sprite := $Sprite2D
@onready var spriteAnim := ["res://Assets/SpamSpaceBarGame/IMG_0404.png",\
 "res://Assets/SpamSpaceBarGame/IMG_0405.png"]
@onready var worldTree := $"../World Tree"
@onready var worldTreeAnim := ["res://Assets/SpamSpaceBarGame/IMG_0395.png", "res://Assets/SpamSpaceBarGame/IMG_0407.png",
"res://Assets/SpamSpaceBarGame/IMG_0408.png", "res://Assets/SpamSpaceBarGame/IMG_0409.png","res://Assets/SpamSpaceBarGame/IMG_0410.png" ]
# Called when the node enters the scene tree for the first time.
func _ready():
	gamemanager.completed = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		count += roundi(1 * gamemanager.jumpStrength)
		sprite.texture = load(spriteAnim[1])
	else:
		sprite.texture = load(spriteAnim[0])
	if count < maxCount * 0.25:
		worldTree.texture = load(worldTreeAnim[0])
	if count > maxCount * 0.25 && count < maxCount * 0.5:
		worldTree.texture = load(worldTreeAnim[1])
	if count > maxCount * 0.5 && count < maxCount * 0.75:
		worldTree.texture = load(worldTreeAnim[2])
	if count > maxCount * 0.75 && count < maxCount:
		worldTree.texture = load(worldTreeAnim[3])
	if count > maxCount:
		gamemanager.completed = true
		worldTree.texture = load(worldTreeAnim[4])
	pass
