extends CharacterBody2D

@onready var gamemanager = get_node("/root/GameManager")
@onready var SPEED : float = 300.0
@onready var JUMP_VELOCITY : float = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animations : AnimatedSprite2D
var sitting : bool
var jumping : bool

@onready var jumpPart = $"Jump Particles"
@onready var RunPart = $CollisionShape2D/AnimatedSprite2D/RunParticles

@onready var runSFX : AudioStreamPlayer2D = $RunSFX
@onready var JumpSFX : AudioStreamPlayer2D = $JumpSFX
func _ready():
	animations = $CollisionShape2D/AnimatedSprite2D
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		runSFX.stop()
		if not animations.is_playing(): 
			jumping = false
			animations.play("Falling")
			

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumping = true
		RunPart.emitting = false
		jumpPart.emitting = true
		animations.play("Jump")
		JumpSFX.pitch_scale = randf_range(0.8, 1.2)
		JumpSFX.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor() && jumping == false:
			if not runSFX.is_playing():
				runSFX.pitch_scale = randf_range(2, 3)
				runSFX.play()
			animations.play("Run")
			sitting = false
			RunPart.emitting = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction == 0 and velocity.y == 0:
		runSFX.stop()
		if sitting == false:
			animations.play("Sit")
			sitting = true
		if sitting == true:
			animations.play("Idle")
	if direction < 0:
		animations.flip_h = true
	if direction > 0:
		animations.flip_h = false

	move_and_slide()
#jump animations is still not playing and idle isn't playing


func _on_upgrade_timer_timeout() -> void:
	SPEED *= gamemanager.playerSpeed2D
	JUMP_VELOCITY *= gamemanager.jumpStrength
	pass # Replace with function body.


func _on_run_sfx_finished() -> void:
	runSFX.pitch_scale += randf_range(-0.2, 0.2)
	pass # Replace with function body.
