extends Node

@onready var main_timer: Timer = $main_timer
@onready var countdown_timer: Timer = $countdown_timer
@onready var countdown_label = $CanvasLayer/countdown_label

signal TrocarControle

var countdown_value = 3

func _ready():
	
	main_timer.wait_time = 10.0
	main_timer.one_shot = false
	main_timer.start()

	countdown_timer.wait_time = 1.0
	countdown_timer.one_shot = true

	countdown_label.visible = false
	countdown_label.text = " "

	main_timer.timeout.connect(_on_main_timer_timeout)
	countdown_timer.timeout.connect(_on_countdown_timer_timeout)

func _on_main_timer_timeout():
	countdown_value = 3
	countdown_label.visible = true
	countdown_label.text = str(countdown_value)
	countdown_timer.start()
	$TrocarSound.play()

func _on_countdown_timer_timeout():
	countdown_value -= 1
	if countdown_value >= 0:
		countdown_label.text = str(countdown_value)
		countdown_timer.start()
	else:
		countdown_label.visible = false
		$TrocarSound.stop()
		_executar_mecanica()

func _executar_mecanica():
	emit_signal("TrocarControle")	
