extends Control

var dialog_lines = [
	"Olá, aventureiro!",
	"Você finalmente chegou à floresta encantada.",
	"Tenha cuidado, há perigos por toda parte..."
]
var current_line = 0

func _ready():
	$Panel/Label.text = ""
	show_next_line()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		show_next_line()

func show_next_line():
	if current_line < dialog_lines.size():
		$Panel/Label.text = dialog_lines[current_line]
		current_line += 1
	else:
		queue_free() # Remove a caixa de diálogo quando acabar
