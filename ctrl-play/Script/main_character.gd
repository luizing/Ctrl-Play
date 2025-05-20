extends CharacterBody2D

@onready var animated_sprite_2d = $Animation as AnimatedSprite2D

signal death

const SPEED = 120.0
const JUMP_VELOCITY = -200.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player1 = true #Essa variavel diz qual o player controla esse personagem.

func _physics_process(delta: float) -> void:
	# --- Lida com quem controla o personagem --- #
	var esquerda
	var direita
	var pulo
	if player1:
		esquerda = "Player1Esquerda"
		direita = "Player1Direita"
		pulo = "Player1Pulo"
	else:
		esquerda = "Player2Esquerda"
		direita = "Player2Direita"
		pulo = "Player2Pulo"
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed(pulo) and is_on_floor():
		$Sounds/Jump.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis(esquerda, direita)
	if direction:
		velocity.x = direction * SPEED
		animated_sprite_2d.trigger_animation(velocity, direction)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.trigger_animation(velocity, direction)

	move_and_slide()

func die():
	$Sounds/Death.play()
	emit_signal("death")
	
func _on_inversor_trocar_controle() -> void:
	if player1:
		player1 = false
	else:
		player1 = true

func _on_k_iller_test_body_entered(body: Node2D) -> void:
	die()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Portal:
		get_tree().change_scene_to_file("res://Fase2.tscn")
	if area is Portal2:
		get_tree().change_scene_to_file("res://Cenas/vitoria.tscn")
		
		
