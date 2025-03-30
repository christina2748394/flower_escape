extends AnimatableBody2D
@export var player_count:int=0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var side_3: CollisionShape2D = $side3
@onready var side_4: CollisionShape2D = $side4




func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	player_count+=1
	print(player_count)



func _on_area_2d_body_exited(body: CharacterBody2D) -> void:
	player_count-=1
	print(player_count)
	
func _process(delta: float) -> void:
	if player_count==2:
		animation_player.play("run")
