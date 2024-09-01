extends Node2D

const player_scene = preload("res://scenes/player.tscn")
var player_ids = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	self.add_child(player)
	player.global_position = position
