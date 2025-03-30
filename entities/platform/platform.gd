extends Node2D
class_name Platform

@onready var po: Marker2D = $Marker2D
var player: Player = null

var direction: Direction.Dir:
	set(value):
		direction_change(value)

func on_player_enter(body: Node2D) -> void:
	player = body as Player
	set_dir()


func on_player_exit(body: Node2D) -> void:
	player = null

func direction_change(dir: Direction.Dir) -> void:
	match dir:
		Direction.Dir.Left: 
			player.remove_double_jump()
			player.teleport()
		Direction.Dir.Top:
			player.remove_double_jump()
			player.add_up_force()
		Direction.Dir.Right:
			player.remove_double_jump()
			player.place_ground()
		Direction.Dir.Down:
			player.add_double_jump()
			

func set_dir() -> void:
	var dir: Vector2 = player.global_position - po.global_position
	var angle: float = dir.angle()
	var new_direction: Direction.Dir
	if angle <= 2.35619449615479 and angle > 0.78539818525314:
		new_direction = Direction.Dir.Down
	elif angle <= 0.78539818525314 and angle > 0:
		new_direction = Direction.Dir.Right
	elif angle <= 0:
		new_direction = Direction.Dir.Top
	elif angle > 2.35619449615479:
		new_direction = Direction.Dir.Left
	
	if new_direction != direction:
		direction = new_direction
