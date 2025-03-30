extends Sprite2D


func pressed():
	frame=2

func unpressed():
	frame=1


	


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	pressed()
	
	
func _on_area_2d_body_exited(body: CharacterBody2D) -> void:
	unpressed()
