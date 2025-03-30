extends Node2D
class_name Origin

@onready var spawn_point: Marker2D = $Marker2D

func respawn(player: Player) -> void:
	player.reset()
	player.global_position = spawn_point.global_position
