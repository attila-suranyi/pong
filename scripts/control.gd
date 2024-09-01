extends Control

var p1_score : int
var p2_score : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Score").text = str(p1_score) + " :Score: " + str(p2_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_p_1_area_2d_body_entered(body: Node2D) -> void:
	p2_score += 1
	get_node("Score").text = str(p1_score) + " :Score: " + str(p2_score)


func _on_p_2_area_2d_body_entered(body: Node2D) -> void:
	p1_score += 1
	get_node("Score").text = str(p1_score) + " :Score: " + str(p2_score)
