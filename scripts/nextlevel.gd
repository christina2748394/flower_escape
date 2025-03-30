extends Area2D

@onready var timer: Timer = $Timer
@onready var celebrate: Node2D = $celebrate
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var player_count:int=0


@warning_ignore("unused_parameter")

func _on_body_entered(body: CharacterBody2D) -> void:
	player_count=player_count+1
	

func _on_body_exited(body: CharacterBody2D) -> void:
	player_count=player_count-1
	
		
func next_level():
	var current_scene_file= get_tree().current_scene.scene_file_path
	var next_level_number=current_scene_file.to_int()+1
	var next_level_path="res://sc/levels/level_"+str(next_level_number)+".tscn"
	print(next_level_path)
	get_tree().change_scene_to_file(next_level_path)

func _process(delta: float) -> void:
	if player_count==2:
		celebrate.visible=true
		AudioControll.winlevel()
		animated_sprite_2d.visible=false
		await get_tree().create_timer(1).timeout
		next_level()
		

		
	#body.get_node("CollisionShape2D").queue_free()dying program sucksdiediediedied
	
	


	
