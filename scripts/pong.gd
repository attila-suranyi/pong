extends Node2D

const player_scene = preload("res://scenes/player.tscn")
const ball_scene = preload("res://scenes/ball.tscn")
const PORT = 7000
const DEFAULT_SERVER_IP = "127.0.0.1" # IPv4 localhost
const MAX_CONNECTIONS = 1

var player_ids = 0
var BALL_STARTING_POS = Vector2(501, 309)
var peer = ENetMultiplayerPeer.new()


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _on_host_pressed() -> void:
	multiplayer.peer_connected.connect(_add_player)
	multiplayer.peer_connected.connect(add_ball)
	
	var error := peer.create_server(PORT, MAX_CONNECTIONS)
	if error:
		printerr("server creation fails")

	multiplayer.multiplayer_peer = peer
	_add_player()


func _on_join_pressed() -> void:
	var error := peer.create_client(DEFAULT_SERVER_IP, PORT)
	if error:
		printerr("client creation fails")
		
	multiplayer.multiplayer_peer = peer
	

func add_ball(id = 1):
	await get_tree().create_timer(2.0).timeout
	
	var new_ball = ball_scene.instantiate()
	new_ball.left_screen.connect(add_ball)
	new_ball.global_position = BALL_STARTING_POS
	
	get_node("SpawnRoot").add_child(new_ball)
	

func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	
	if id == 1:
		player.global_position = Vector2(112, 312)
	else:
		player.global_position = Vector2(1012, 312)
	
	get_node("SpawnRoot").add_child(player)
