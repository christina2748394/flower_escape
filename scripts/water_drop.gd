extends Area2D

@onready var portal: Node = %Portal
@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_body_entered(body: CharacterBody2D) -> void:
	portal.add_point()
	print("+1")
	animation_player.play("pick_up")
