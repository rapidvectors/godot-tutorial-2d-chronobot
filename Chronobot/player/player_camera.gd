extends Camera2D

@export var player : CharacterBody2D

func _physics_process(delta):
	if player != null:
		global_position = player.global_position
