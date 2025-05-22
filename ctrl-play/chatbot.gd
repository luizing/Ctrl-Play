extends CanvasLayer

@export var messages: Array[String] = []
@export var delay_between_messages := 2.0

var current_message := 0

func _ready():
	$ChatPanel/MessageTimer.wait_time = delay_between_messages
	$ChatPanel/MessageTimer.connect("timeout", Callable(self, "_on_MessageTimer_timeout"))
	if messages.size() > 0:
		show()
		_show_next_message()

func _show_next_message():
	if current_message < messages.size():
		var label = Label.new()
		label.text = messages[current_message]
		label.autowrap = true
		$ChatPanel/ScrollContainer/MessageContainer.add_child(label)
		current_message += 1
		$ChatPanel/MessageTimer.start()
	else:
		hide()

func _on_MessageTimer_timeout():
	_show_next_message()
