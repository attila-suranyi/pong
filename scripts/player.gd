extends Area2D

const SPEED := 300
var v := 0.0

func _physics_process(delta):
	var direction = Input.get_axis("move_up", "move_down")
	v = direction * SPEED
	
	var viewport_size := get_viewport_rect().size
	
	var next_pos = position.y + v * delta
	if next_pos <= viewport_size.y and next_pos > 0:
		position.y += v * delta
	
	
