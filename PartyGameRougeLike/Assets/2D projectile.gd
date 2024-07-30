extends Node2D

@onready var player = get_parent().get_parent().get_node("StandardPlayer")
@onready var gamemanager = get_node("/root/GameManager")
@onready var rb : RigidBody2D = $RigidBody2D
@export var endPosY : float
@onready var startPosX : float
@onready var ps = load("res://Assets/FishingAssets/Splash.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	startPosX = randf_range(-849, 829)
	position = Vector2(startPosX, position.y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if rb.position.y >= endPosY:
		var psInstance = ps.instantiate()
		get_parent().add_child(psInstance)
		psInstance.position = Vector2(startPosX, endPosY)
		self.queue_free()
	pass


func _on_area_2d_body_entered(_body):
	if !null:
		gamemanager.death = true
		gamemanager.completed = false
		player.queue_free()
	pass # Replace with function body.

func _exit_tree():
	gamemanager.score += 10
