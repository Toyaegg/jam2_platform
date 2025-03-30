extends Node
class_name Movement

var player: Player
var direction: float

func _ready() -> void:
	player = get_parent()

func _process(delta: float) -> void:
	direction = Input.get_axis("move_left", "move_right")

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction:
		player.velocity.x = direction * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)

	player.move_and_slide()
