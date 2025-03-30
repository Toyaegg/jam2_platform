extends Control
class_name Transformer

@onready var rect: ColorRect = $ColorRect

signal finish

func play() -> void:
	var tween: Tween = get_tree().create_tween()
	rect.visible = true
	tween.chain().tween_property(rect, "self_modulate", Color.TRANSPARENT, 1)
	tween.finished.connect(tween_finish)
	
	tween.play()


func tween_finish() -> void:
	rect.visible = false
	rect.self_modulate = Color.WHITE
	finish.emit()
