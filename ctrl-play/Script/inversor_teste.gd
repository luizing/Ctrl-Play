extends Area2D
signal TrocarControle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_exited(body: Node2D) -> void:
	print("Troca de controles em 2 segundos!")
	$TimerInverterControles.start()
	
	


func _on_timer_inverter_controles_timeout() -> void:
	emit_signal("TrocarControle")
