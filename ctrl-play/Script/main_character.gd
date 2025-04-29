extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D as AnimatedSprite2D

const SPEED = 120.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite_2d.trigger_animation(velocity, direction)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.trigger_animation(velocity, direction)

	move_and_slide()
