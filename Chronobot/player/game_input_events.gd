class_name GameInputEvents
extends Node


static func movement_input() -> float:
	var direction : float = Input.get_axis("move_left", "move_right")
	return direction


static func jump_input() -> bool:
	var jump_input : bool = Input.is_action_just_pressed("jump")
	return jump_input


static func shoot_input() -> bool:
	var shoot_input : bool = Input.is_action_just_pressed("shoot")
	return shoot_input


static func shoot_up_input() -> bool:
	var shoot_input : bool = Input.is_action_just_pressed("shoot")
	var up_input : bool = Input.is_action_pressed("look_up")
	return up_input and shoot_input


static func crouch_input() -> bool:
	var crouch_input : bool = Input.is_action_just_pressed("crouch")
	return crouch_input


static func fall_input() -> bool:
	var fall_input : bool = Input.is_action_just_pressed("force_fall")
	return fall_input


static func wall_cling_input() -> bool: 
	var wall_cling_input : bool = Input.is_action_pressed("wall_cling")
	return wall_cling_input
