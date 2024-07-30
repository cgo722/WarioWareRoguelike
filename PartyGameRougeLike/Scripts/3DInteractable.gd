extends Node3D

@onready var gamemanager = get_node("/root/GameManager")
var bag = []
var ranPos
var locations = [Vector3(-0.2, 7.2, -13.9), Vector3(12.6, 7.8, -19.9), Vector3(22.3, 6.4, -4.5), Vector3(-6.4, 9.1, -2.5), Vector3(-11.7, 1.9, -1.9)]
@onready var anim = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	Bag()
	anim.play("RESET")
	pass # Replace with function body.

func Bag():
	bag += locations
	var sel = randi_range(0, bag.size() - 1)
	ranPos = bag[sel]
	position = ranPos
	if bag.size() <= 1:
		bag += locations
	bag.remove_at(sel)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass





func _on_area_3d_body_entered(_body):
	gamemanager.completed = true
	gamemanager.score += 100
	Bag()
	pass # Replace with function body.
