extends StaticBody2D

const SPEED = 100.0
var velocity_x = 0.0

# Variáveis para o salto
var jump_speed = -400.0 # velocidade inicial do salto (negativo = para cima)
var gravity = 900.0 # gravidade que puxa para baixo
var velocity_y = 0.0 # velocidade vertical atual
var start_y = 0.0 # posição inicial no eixo Y
var is_jumping = false # se a plataforma está no ar

func _ready():
	start_y = position.y

func _physics_process(delta: float) -> void:
	# --- Movimento horizontal ---
	var direction := Input.get_axis("PlataformaEsquerda", "PlataformaDireita")
	
	if direction != 0:
		velocity_x = direction * SPEED
	else:
		velocity_x = move_toward(velocity_x, 0, SPEED)
	
	position.x += velocity_x * delta

	# --- Movimento de salto controlado ---
	if Input.is_action_just_pressed("PlataformaPulo") and not is_jumping:
		velocity_y = jump_speed
		is_jumping = true

	if is_jumping:
		velocity_y += gravity * delta
		position.y += velocity_y * delta

		# Quando aterrissar, para o salto
		if position.y >= start_y:
			position.y = start_y
			velocity_y = 0
			is_jumping = false
