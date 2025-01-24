extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D


const SPEED = 150.0
const JUMP_VELOCITY = -200.0
var DIRECTION = 1
var had_jump: bool= false
var maxjumps: int = 2
var actualjumps: int = 0




func _process(delta):
	if DIRECTION == 1:
		animated_sprite_2d.flip_h = false
	else:
		animated_sprite_2d.flip_h = true 
	

func _physics_process(delta: float) -> void:
	 
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_floor():
		had_jump=false
		actualjumps=0 
		animated_sprite_2d.play("idle")
	#estoy resenteando estos valores para llevar un control de ellos cuando llegue al piso
		

	velocity.x = SPEED * Input.get_axis("izquierda", "derecha")
	move_and_slide()
	
	if Input.is_action_just_pressed("saltar") and actualjumps<maxjumps:
		animated_sprite_2d.play("salto")
		velocity.y = JUMP_VELOCITY
		actualjumps += 1
		


func _input(event):
	if event.is_action_pressed("izquierda"):
		DIRECTION = -1
	if event.is_action_pressed("derecha"):
		DIRECTION = 1
		

	
