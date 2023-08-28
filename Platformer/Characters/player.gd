extends CharacterBody2D

@onready var bullet = preload("res://Weapons/Bullet.tscn")
#Related to physics
var direction
var b 
const SPEED = 300.0
const JUMP_VELOCITY = -400.0	


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var rotatingSprite : Sprite2D = $SimpleCharacterSprite

func _physics_process(delta):
	# Add the gravity.
	shoot()
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func shoot():
	if Input.is_action_just_pressed("Attack"):
		b = bullet.instantiate()
		add_child(b)
