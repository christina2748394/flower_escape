extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var interaction_area: InteractionArea = $InteractionArea
@export var door: Sprite2D

var is_open=false


func _ready():
	interaction_area.interact=Callable(self,"_on_interact")

func _on_interact():
	if sprite_2d.frame==4:
		sprite_2d.frame=3 
	else: 
		sprite_2d.frame=4
		
	if is_open==false:
		door.open_door()
		is_open=!is_open
	else:
		door.close_door()
		is_open=!is_open

	
	
