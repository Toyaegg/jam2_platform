extends Node2D
class_name DeadZone

signal  player_enter

func on_player_enter(body: Node2D) -> void:
	player_enter.emit()
