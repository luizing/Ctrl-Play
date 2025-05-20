extends Control

var startPath = "res://Fase 1.tscn"
var CreditosPath = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_iniciar_btn_pressed() -> void:
	get_tree().change_scene_to_file(startPath)


func _on_iniciar_btn_button_down() -> void:
	get_tree().change_scene_to_file(startPath)


func _on_creditos_btn_2_pressed() -> void:
	get_tree().change_scene_to_file(startPath)
