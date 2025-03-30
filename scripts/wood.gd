extends CharacterBody2D

var push=true
var direction=0
var push_force=0

func _physics_process(delta: float) -> void:
	if push:
		velocity.x = direction* delta*1000
	else:
		velocity.x=0
	move_and_slide()
	for i in get_slide_collision_count():
		var c=get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal()*push_force)
	

func _on_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		direction=-1
		push=true
		
		
func _on_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		direction=1
		push=true
		
		

func _on_left_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		direction=0
		push=false


func _on_right_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		direction=0
		push=false
