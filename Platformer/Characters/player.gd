extends CharacterBody2D
#Related to my health system
signal life_changed(player_hearts)
var max_hearts: int = 2
var hearts: float = max_hearts

#Related to physics
var direction
const SPEED = 300.0
const JUMP_VELOCITY = -400.0	

func damage(dam: int, direction: int, force: int) -> void:
	hearts -= dam*0.5
	emit_signal("life_changed", hearts)
	if hearts <= 0:
		hearts = 3



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var rotatingSprite : Sprite2D = $SimpleCharacterSprite

func _physics_process(delta):
	# Add the gravity.
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
