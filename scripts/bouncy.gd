extends Node2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer




func _on_area_2d_body_entered(body) -> void:
	if (body.is_in_group("players")):
		body.velocity.y=-500
		animation_player.play("bounce")
	
		
