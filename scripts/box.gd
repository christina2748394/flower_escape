extends CharacterBody2D

var push=true
var direction=0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if push:
		velocity.x = direction* delta*1000
	else:
		velocity.x=0
	move_and_slide()
	
func _on_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		direction=-1
		print("pushing")
		push=true

func _on_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		direction=1
		print("pushing")
		push=true
		

func _on_left_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		direction=0
		push=false


func _on_right_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		direction=0
		push=false
