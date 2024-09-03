extends CharacterBody2D

@export var speed := 300
@export var rotation_speed := 0.02
var v := 0.0
@export var id : int

func _physics_process(delta):
	print(rotation)
	var direction = Vector2(0, 0)
	var rotation_dir := 0.0
	if id == 0:
		direction = Input.get_axis("p1_move_up", "p1_move_down")
		rotation_dir = Input.get_axis("p1_left", "p1_right")
	else:
		direction = Input.get_axis("p2_move_up", "p2_move_down")
		rotation_dir = Input.get_axis("p2_left", "p2_right")
		
	v = direction * speed
	rotation = rotation + rotation_dir * rotation_speed
	
	var viewport_size := get_viewport_rect().size
	
	var next_pos = position.y + v * delta
	if next_pos <= viewport_size.y and next_pos > 0:
		position.y += v * delta
	
	
