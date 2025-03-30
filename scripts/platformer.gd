extends AnimatableBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	animation_player.play("up")
