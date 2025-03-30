extends CanvasLayer
class_name  HUD

var transformer: Transformer = preload("res://base/transformer.tscn").instantiate()

@onready var clearance: ColorRect = $Clearance
@onready var button: Button = $Clearance/Button

signal play_finish
signal click_restart

func _ready() -> void:
	add_child(transformer)
	transformer.finish.connect(finish)
	button.pressed.connect(restart)

func play() -> void:
	transformer.play()
	

func finish() -> void:
	play_finish.emit()


func show_clearance() -> void:
	clearance.visible = true


func restart() -> void:
	clearance.visible = false
	click_restart.emit()
