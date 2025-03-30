extends Node
class_name LevelManager

var world: World
var level: Level

func _ready() -> void:
	level = get_parent()


func set_world(world: World) -> void:
	self.world = world
