extends Node2D
class_name Destination

signal next_level
#@onready var flag: Area2D = $Flag/Area2D


func on_player_enter(body: Node2D) -> void:
	next_level.emit()
