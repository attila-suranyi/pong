extends CharacterBody2D

const SPEED := 300
var v := 0.0
@export var id : int

func _physics_process(delta):
	var direction = Vector2(0, 0)
	if id == 1:
		direction = Input.get_axis("p2_move_up", "p2_move_down")
	else:
		direction = Input.get_axis("p1_move_up", "p1_move_down")
	v = direction * SPEED
	
	var viewport_size := get_viewport_rect().size
	
	var next_pos = position.y + v * delta
	if next_pos <= viewport_size.y and next_pos > 0:
		position.y += v * delta
	
	
