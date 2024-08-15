extends CharacterBody3D

@onready var gamemanager = get_node("/root/GameManager")
@onready var SPEED : float = 4.0 * gamemanager.playerSpeed3D
@onready var animT : AnimationTree = $Alien/AnimationTree
@onready var JUMP_VELOCITY : float = 6 * gamemanager.jumpStrength
@onready var mesh = $Alien
@onready var runningParticles = $"3dSmokeClouds"
@export var twoD : bool = false
@onready var JASP = $JumpSFX
@onready var WASP = $WalkSFX
var direction 
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _ready():
	animT.active = true
	
func _process(_delta):
	AnimTreeState()
	

func _physics_process(delta):
	# Add the gravity.
	velocity.y -= gravity * delta


	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		JASP.play()
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if not twoD == true:
		direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	else:
		direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if not WASP.is_playing() and is_on_floor():
			WASP.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if not is_on_floor() or not direction:
		WASP.stop()

	if not direction.x == 0 or not direction.z == 0:
		mesh.rotation.y = Vector2(direction.x, -direction.z).angle()
	move_and_slide()
	
func AnimTreeState(): #got to get landing to work
	if velocity == Vector3.ZERO:
		animT["parameters/conditions/isIdle"] = true
		animT["parameters/conditions/isMoving"] = false
		animT["parameters/conditions/isJumping"] = false
		animT["parameters/conditions/isFalling"] = false
		animT["parameters/conditions/landed"] = false
		runningParticles.emitting = false
	else:
		if velocity.y == 0:
			animT["parameters/conditions/isMoving"] = true
			animT["parameters/conditions/isIdle"] = false
			animT["parameters/conditions/landed"] = false
			runningParticles.emitting = true
		else:
			if velocity.y > 0.1:
				animT["parameters/conditions/isJumping"] = true
				animT["parameters/conditions/isMoving"] = false
				animT["parameters/conditions/isIdle"] = false
				runningParticles.emitting = false
			else:
				if velocity.y < -0.1:
					animT["parameters/conditions/isFalling"] = true
					animT["parameters/conditions/isJumping"] = false
					
				else:
					if is_on_floor():
						animT["parameters/conditions/landed"] = true
						animT["parameters/conditions/isFalling"] = false
	pass
