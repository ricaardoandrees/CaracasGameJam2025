extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0
var DIRECTION = 1


func _process(delta):
	if DIRECTION == 1:
		animated_sprite_2d.flip_h = false
	else:
		animated_sprite_2d.flip_h = true 
	

func _physics_process(delta: float) -> void:
	 #Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	velocity.x = SPEED * Input.get_axis("izquierda", "derecha")
	move_and_slide()
	 #Handle jump.


	move_and_slide()
	
#if Input.is_action_just_pressed("saltar") and is_on_floor():
	#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
func _input(event):
	if event.is_action_pressed("izquierda"):
		DIRECTION = -1
	if event.is_action_pressed("derecha"):
		DIRECTION = 1
		
#if :
	
#else:
	#velocity.x = move_toward(velocity.x, 0, SPEED)
		#IRECTION = -1
