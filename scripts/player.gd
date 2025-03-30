

extends CharacterBody2D

@export var player_id=1

const SPEED = 130.0
const JUMP_VELOCITY = -250.0
const GRAVITY=1000
const FALL_GRAVITY=1500
const dash=500


var jump_max=2
var jump_count=0
var tween:Tween
var dash_velocity=0
var push_force=50

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



func _ready() -> void:
	AudioControll.walksound()



#falling effect
func get_fall_gravity(velocity:Vector2):
	if velocity.y<0:
		return GRAVITY
	return FALL_GRAVITY
	
		

#jumping
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += get_fall_gravity(velocity) * delta
	#small jump
	if Input.is_action_just_released("jump_%s"%[player_id]) and velocity.y < 0:
		velocity.y=JUMP_VELOCITY/1.5
	# Handle jump.
	if Input.is_action_just_pressed("jump_%s"%[player_id]) and jump_count<jump_max:
		jump_count+=1
		velocity.y = JUMP_VELOCITY
		
	#reset
	if is_on_floor() and jump_count!=0:
		jump_count=0
		#dash

	
	
		

#moving
	var direction := Input.get_axis("left_%s"%[player_id], "right_%s"%[player_id])
	var magic=Input.is_action_pressed("dash_1")
	# Flip direction
	if direction>0:
		animated_sprite_2d.flip_h=false
	elif direction<0:
		animated_sprite_2d.flip_h=true
	# play animation
	if is_on_floor():
		if magic:
			animated_sprite_2d.play("magic")
		elif direction==0:
			animated_sprite_2d.play("idle")
			AudioControll.walkstop()
			
		else:
			animated_sprite_2d.play("run")
			AudioControll.walking()
			
	else:
		AudioControll.walkstop()
		#animated_sprite_2d.play("jump")
	
		

		
		
	
	# move horizontal
	if direction:
		velocity.x = direction * (SPEED + dash_velocity)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var c=get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal()*push_force)
