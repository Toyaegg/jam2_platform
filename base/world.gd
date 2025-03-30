extends Node2D
class_name World

var current_level: String
var used_level: Level

var player: Player

signal level_change
signal clearance

func start() -> void:
	current_level = "level_1"
	used_level = get_level()
	player = get_player()
	get_level()
	add_child(player)
	player.reset()
	add_child(used_level)
	
	used_level.reset()
	process_mode = Node.PROCESS_MODE_INHERIT

func change_level(level: String) -> void:
	remove_level()
	current_level = level
	if(current_level != "clearance"):
		remove_child(player)
		used_level = get_level()
		add_child(player)
		player.reset()
		add_child(used_level)
		used_level.reset()
		level_change.emit()
	else:
		if player.get_parent():
			clearance.emit()
			remove_child(player)

func remove_level() -> void:
	remove_child(used_level)
	for ground in player.grounds:
		remove_child(ground)
		ground.queue_free()
	player.grounds.clear()
	process_mode = Node.PROCESS_MODE_DISABLED
	
	
func change_finish() -> void:
	
	process_mode = Node.PROCESS_MODE_INHERIT
	
	
func get_level() -> Level:
	return load("res://levels/" + current_level + ".tscn").instantiate()


func get_player() -> Player:
	return preload("res://entities/player/player.tscn").instantiate()
