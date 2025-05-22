extends CanvasLayer

# Tempo entre mensagens (segundos)
@export var delay_between_messages := 2.0

# Mensagens internas
var messages: Array[String] = []
var current_index := 0

func _ready():
	visible = false
	$ChatPanel/MessageTimer.timeout.connect(_on_MessageTimer_timeout)
	$ChatPanel/MessageTimer.wait_time = delay_between_messages

# Método para iniciar o chat
func start_chat(new_messages: Array[String]) -> void:
	messages = new_messages
	current_index = 0
	$ChatPanel/ScrollContainer/MessageContainer.queue_free_children()  # limpa mensagens antigas
	visible = true
	_show_next_message()

func _show_next_message():
	if current_index < messages.size():
		var label = Label.new()
		label.text = messages[current_index]
		label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		$ChatPanel/ScrollContainer/MessageContainer.add_child(label)
		current_index += 1
		$ChatPanel/MessageTimer.start()
		await get_tree().process_frame
		$ChatPanel/ScrollContainer.scroll_vertical = $ChatPanel/ScrollContainer.get_v_scroll_bar().max_value
	else:
		visible = false

func _on_MessageTimer_timeout():
	_show_next_message()
