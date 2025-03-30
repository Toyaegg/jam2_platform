extends Node2D
class_name Level

@export var next_level: String

var world: World

@onready var manager: LevelManager = $LevelManager

@onready var origin: Origin = $Origin
@onready var destination: Destination = $Destination
@onready var dead_zone: DeadZone = $DeadZone

var win_timer: SceneTreeTimer

func _ready() -> void:
	world = get_parent()
	manager.set_world(world)
	
	dead_zone.player_enter.connect(reset)
	destination.next_level.connect(win)


func reset() -> void:
	origin.respawn(world.player)


func win() -> void:
	win_timer = get_tree().create_timer(2)
	win_timer.timeout.connect(next)

func next() -> void:
	world.change_level(next_level)
