extends Node
class_name DoubleJump

var player: Player
var jump_count: int = 0

func _ready() -> void:
	player = get_parent()
	

func _process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("jump") and not player.is_on_floor() and (jump_count == 0):
		player.velocity.y = player.JUMP_VELOCITY
		jump_count += 1
	
	if player.is_on_floor() and (jump_count == 1):
		player.remove_child(self)
		queue_free()
	  
 
