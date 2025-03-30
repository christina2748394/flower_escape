extends Node2D



func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if (body.is_in_group("players")):
		body.velocity.y=-400
	
