extends NodeState

var bullet = preload("res://player/bullet.tscn")

@export var character_body_2d : CharacterBody2D
@export var animated_sprite_2d : AnimatedSprite2D
@export var muzzle : Marker2D

var wall_cling_direction : Vector2
var muzzle_position : Vector2

func on_process(delta : float):
	pass


func on_physics_process(delta : float):
	character_body_2d.velocity.y = 0
	
	var direction : float = GameInputEvents.movement_input()
	
	if direction > 0 and wall_cling_direction == Vector2.ZERO:
		animated_sprite_2d.flip_h = true
		wall_cling_direction = Vector2.RIGHT
	
	if direction < 0 and wall_cling_direction == Vector2.ZERO:
		animated_sprite_2d.flip_h = false
		wall_cling_direction = Vector2.LEFT
	
	gun_muzzle_position()
	
	if GameInputEvents.shoot_input():
		gun_shooting()
	
	character_body_2d.move_and_slide()
	
	# transitioning states
	
	# jump state
	if GameInputEvents.jump_input():
		transition.emit("Jump")
	
	# forced fall state
	if GameInputEvents.fall_input():
		transition.emit("Fall")


func enter():
	muzzle.position = Vector2(21, -26)
	muzzle_position = muzzle.position
	
	animated_sprite_2d.play("shoot_wall_cling")


func exit():
	wall_cling_direction = Vector2.ZERO
	animated_sprite_2d.stop()


func gun_muzzle_position():
	if !animated_sprite_2d.flip_h:
		muzzle.position.x = muzzle_position.x
	elif animated_sprite_2d.flip_h:
		muzzle.position.x = -muzzle_position.x


func gun_shooting():
	var direction : float = -1 if animated_sprite_2d.flip_h == true else 1
	
	var bullet_instance = bullet.instantiate() as Node2D
	bullet_instance.direction = direction
	bullet_instance.move_x_direction = true
	bullet_instance.global_position = muzzle.global_position
	get_parent().add_child(bullet_instance)
