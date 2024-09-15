extends CharacterBody2D

@export var speed := 300
@export var rotation_speed := 0.02
var v := 0.0
@export var id : int

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func _physics_process(delta):
	print(position)
	
	if position == Vector2(0, 0):
		print("moved")
	
	var direction = Vector2(0, 0)
	var rotation_dir := 0.0
	if is_multiplayer_authority():
		direction = Input.get_axis("p1_move_up", "p1_move_down")
		v = direction * speed
		var viewport_size := get_viewport_rect().size
		var next_pos = position.y + v * delta
		if next_pos <= viewport_size.y and next_pos > 0:
			position.y += v * delta
		
		rotation_dir = Input.get_axis("p1_left", "p1_right")
		rotation = rotation + rotation_dir * rotation_speed
