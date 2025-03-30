extends Node

@onready var testbutton: Node2D = $testbutton
@onready var sprite_2d: Sprite2D = $Sprite2D

var score=0

func _ready() -> void:
	sprite_2d.modulate.a8=0

func add_point():
	score+=1
	
	
func _process(delta: float) -> void:
	if score==16:
		testbutton.visible=true
		testbutton._on()

func transport():
	#while sprite_2d.modulate.a8<1000:
		#sprite_2d.modulate.a8+=100
	await get_tree().create_timer(1).timeout	
	var current_scene_file= get_tree().current_scene.scene_file_path
	var next_level_number=current_scene_file.to_int()+1
	var next_level_path="res://sc/levels/level_"+str(next_level_number)+".tscn"
	print(next_level_path)
	get_tree().change_scene_to_file(next_level_path)
	
	
