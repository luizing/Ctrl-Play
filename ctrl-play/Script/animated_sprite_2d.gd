extends AnimatedSprite2D

class_name Animacao


func trigger_animation(velocity: Vector2, direction: int):
	
	if direction != 0:
		flip_h = direction < 0  # True para esquerda, False para direita
	
	if velocity.x != 0:
		play("run")
	else:
		play("idle")
	
	
