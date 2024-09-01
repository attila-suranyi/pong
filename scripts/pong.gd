extends Node2D

const player_scene = preload("res://scenes/player.tscn")
const ball_scene = preload("res://scenes/ball.tscn")
var player_ids = 0
var BALL_STARTING_POS = Vector2(301, 309)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Ball").left_screen.connect(spawn_ball)
	
	var player_1_pos := Vector2(112, 312)
	spawn_player(player_1_pos)
	var player_2_pos := Vector2(1012, 312)
	spawn_player(player_2_pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_player(position):
	var player: CharacterBody2D = player_scene.instantiate()
	player_ids += player_ids + 1
	player.id = player_ids
	player.global_position = position
	self.add_child(player)
	
func spawn_ball():
	await get_tree().create_timer(2.0).timeout
	var new_ball = ball_scene.instantiate()
	new_ball.left_screen.connect(spawn_ball)
	new_ball.global_position = BALL_STARTING_POS
	self.add_child(new_ball)
