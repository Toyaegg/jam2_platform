extends Node
class_name Jump

var player: Player

func _ready() -> void:
	player = get_parent()

func _process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = player.JUMP_VELOCITY
