extends NodeState

@export var character_body_2d : CharacterBody2D
@export var animated_sprite_2d : AnimatedSprite2D

@export_category("Physics Friction")
@export var slow_down_speed : int = 1700

func on_process(delta : float):
	pass


func on_physics_process(delta : float):
	character_body_2d.velocity.x = move_toward(character_body_2d.velocity.x, 0, slow_down_speed)
	
	character_body_2d.move_and_slide()
	
	# transitioning states
	
	# fall state
	if !character_body_2d.is_on_floor():
		transition.emit("Fall")
	
	# run state
	var direction : float = GameInputEvents.movement_input()
	
	if direction and character_body_2d.is_on_floor():
		transition.emit("Run")
	
	# jump state
	if GameInputEvents.jump_input():
		transition.emit("Jump")
	
	# shoot stand state
	if GameInputEvents.shoot_input():
		transition.emit("ShootStand")
	
	# shoot up state
	if GameInputEvents.shoot_up_input():
		transition.emit("ShootUp")
	
	# shoot crouch state
	if GameInputEvents.crouch_input():
		transition.emit("ShootCrouch")


func enter():
	animated_sprite_2d.play("idle")


func exit():
	animated_sprite_2d.stop()
