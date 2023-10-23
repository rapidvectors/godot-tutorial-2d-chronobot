extends AnimatedSprite2D

var speed : int = 600
var direction : int

func _physics_process(delta):
	move_local_x(direction * speed * delta)

func _on_timer_timeout():
	queue_free()
