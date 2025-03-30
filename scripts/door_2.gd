extends Sprite2D


func open_door():
	frame=9
	%DoorCollision.set_deferred("disabled",true)
	
func close_door():
	frame=10
	%DoorCollision.set_deferred("disabled",false)
