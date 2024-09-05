extends CharacterBody2D

signal left_screen

var speed = 550
const speed_growth_rate = 17
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	var random_x = rng.randf_range(-500.00, 500.0)
	var random_y = rng.randf_range(-200.00, 200.0)
	var rand_velocity = Vector2(random_x, random_y)
	rand_velocity = rand_velocity.normalized()
	velocity = rand_velocity * speed
	
	get_node("VisibleOnScreenNotifier2D").screen_exited.connect(_on_VisibilityNotifier2D_screen_exited)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		var collider := collision.get_collider()
		if collider is CharacterBody2D:
			velocity = velocity * (1 + speed_growth_rate) ** delta

func _on_VisibilityNotifier2D_screen_exited():
	print("EMIT")
	left_screen.emit()
	queue_free()
