extends Node

var world: World = preload("res://base/world.tscn").instantiate()
var hud: CanvasLayer = preload("res://base/hud.tscn").instantiate()

func _ready() -> void:
	add_child(world)
	add_child(hud)
	world.start()
	
	world.level_change.connect(hud.play)
	world.clearance.connect(hud.show_clearance)
	hud.play_finish.connect(world.change_finish)
	hud.click_restart.connect(world.start)
	
