extends CharacterBody2D

signal left_screen

var speed = 750

func _ready() -> void:
	velocity = Vector2(-500, -200)
	get_node("VisibleOnScreenNotifier2D").screen_exited.connect(_on_VisibilityNotifier2D_screen_exited)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()

func _on_VisibilityNotifier2D_screen_exited():
	left_screen.emit()
	print("EMIT")
	queue_free()
