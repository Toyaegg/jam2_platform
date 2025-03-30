extends CharacterBody2D
class_name Player

const SPEED = 500.0
const JUMP_VELOCITY = -1000.0
const BOUNCE_VELOCITY = -1500.0

var dj: DoubleJump
var grounds: Array[Ground]

func place_ground() -> void:
	var ground: Ground = load("res://entities/ground/ground.tscn").instantiate()
	ground.global_position = global_position
	ground.global_position.x += 500
	ground.global_position.y += 100
	grounds.append(ground)
	call_deferred("add_sibling", ground)
	
func teleport() -> void:
	global_position.x += 600

func add_up_force() -> void:
	velocity.y = BOUNCE_VELOCITY
	
func remove_double_jump() -> void:
	if dj:
		remove_child(dj)
	
func add_double_jump() -> void:
	dj = DoubleJump.new()
	add_child(dj)

func reset() -> void:
	velocity = Vector2.ZERO
	global_position = Vector2.ZERO
	
