extends Node2D

@onready var gamemanager = get_node("/root/GameManager")
@export var scoreIncrease := [5, ]
@onready var maxCount : int = randi_range(1, 100) * gamemanager.otherSpeed2D
var count : int
@onready var sprite := $Sprite2D
@onready var spriteAnim := ["res://Assets/SpamSpaceBarGame/IMG_0404.png",\
 "res://Assets/SpamSpaceBarGame/IMG_0405.png"]
@onready var worldTree := $"../../ParallaxMidGround/World Tree"
@onready var worldTreeAnim := ["res://Assets/SpamSpaceBarGame/IMG_0395.png", "res://Assets/SpamSpaceBarGame/IMG_0407.png",
"res://Assets/SpamSpaceBarGame/IMG_0408.png", "res://Assets/SpamSpaceBarGame/IMG_0409.png","res://Assets/SpamSpaceBarGame/IMG_0410.png" ]
@onready var camShake := $"../../../Camera2D/ShakerComponent2D"
@onready var woodChipParticles := load("res://Assets/Particle FX/WoodChips.tscn")
var scored : bool
@onready var worldTree2 := $"../../ParallaxMidGround/World Tree2"
@onready var worldTree2Anim := $"../../ParallaxMidGround/World Tree2/AnimationPlayer"
# Called when the node enters the scene tree for the first time.
func _ready():
	worldTree2.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		count += roundi(1 * gamemanager.jumpStrength)
		sprite.texture = load(spriteAnim[1])
		camShake.play_shake()
		var woodChipInstance = woodChipParticles.instantiate()
		self.add_child(woodChipInstance)
		scoreChange(scoreIncrease[0])
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
	if gamemanager.completed == true && scored == false:
		scoreChange(scoreIncrease[1])
		scored = true
		worldTree2.visible = true
		worldTree2Anim.play("Falling Animation")
		gamemanager.finished = true
	pass


func scoreChange(change : int):
	gamemanager.score += change


func _on_instruction_timer_timeout():
	$"../../../CanvasLayer".queue_free()
	pass # Replace with function body.
