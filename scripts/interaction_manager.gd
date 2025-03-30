extends Node2D

@onready var player=get_tree().get_first_node_in_group("players")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var active_areas=[] 
var can_interact=true

func register_area(area:InteractionArea):
	active_areas.push_back(area)
	
func unregister_area(area:InteractionArea):
	var index=active_areas.find(area)
	if index!=-1:
		active_areas.remove_at(index)
		
func _process(delta):
	if active_areas.size()>0 && can_interact:
		animated_sprite_2d.global_position=active_areas[0].global_position
		animated_sprite_2d.global_position.y-=25
		animated_sprite_2d.global_position.x-=0
		animated_sprite_2d.show()
	
	else:
		animated_sprite_2d.hide()
		
	
func _input(event):
	if event.is_action_pressed("interact") && can_interact:
		if active_areas.size()>0:
			can_interact=false
			animated_sprite_2d.hide()
			
			await active_areas[0].interact.call()
			can_interact=true

		
			
