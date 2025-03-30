extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea2
@onready var spite = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $InteractionArea2/CollisionShape2D
@export var portal: Node





func _on():
	collision_shape_2d.disabled=false
	interaction_area.interact=Callable(self,"_on_interact")

func _on_interact():
	spite.play("magic")
	portal.transport()
