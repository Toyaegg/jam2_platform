extends Node
class_name Fall

var player: Player

func _ready() -> void:
	player = get_parent()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta * 3
