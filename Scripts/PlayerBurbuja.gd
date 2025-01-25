extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0
var DIRECTION = 1
var had_jump: bool= false
var maxjumps: int = 2
var actualjumps: int = 0
var peso = 1
var escalaMIN : Vector2
@onready var balla_burbuja = preload("res://Scenes/balla_burbuja.tscn")
var contador_disparos: int= 0
var little: bool = false
var escalaINICIAL : Vector2



func _ready():
	escalaMIN = animated_sprite_2d.scale * 0.6
	print(escalaMIN)
	escalaINICIAL = animated_sprite_2d.scale
	


func _process(delta):
	if DIRECTION == 1:
		animated_sprite_2d.flip_h = false
	else:
		animated_sprite_2d.flip_h = true 
	

func _physics_process(delta: float) -> void:
	 
	if not is_on_floor():
		velocity += (get_gravity() * delta * (peso**0.1)) if( velocity.y < 0) else (get_gravity() * delta * peso)
		
	if is_on_floor() and (not animated_sprite_2d.is_playing()):
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
		
	if Input.is_action_pressed("inflar"):
		animated_sprite_2d.play("inflar")
		peso = 0.01

	elif Input.is_action_just_released("inflar"):
			animated_sprite_2d.stop()
			peso = 1



		


func muelto():
	animated_sprite_2d.play("muerte")


func _input(event):
	if event.is_action_pressed("izquierda"):
		DIRECTION = -1
	if event.is_action_pressed("derecha"):
		DIRECTION = 1
		
	if event.is_action_pressed("disparar"):
		contador_disparos+=1
		little = true
		animated_sprite_2d.play("disparar")
		print("piu piu")
		var instancia = balla_burbuja.instantiate()
		instancia.global_position = global_position

		instancia.DIRECTION = DIRECTION
		if contador_disparos<6:
			animated_sprite_2d.scale = (animated_sprite_2d.scale * 0.9 ) if (escalaMIN < animated_sprite_2d.scale) else escalaMIN
			collision_shape_2d.scale = (animated_sprite_2d.scale * 0.9) if (escalaMIN < animated_sprite_2d.scale) else escalaMIN
			 

		get_parent().add_child(instancia)
	if event.is_action_pressed("suicidarse"):
		print("muelto")
		animated_sprite_2d.play("muerte")
		print("mori")
		
		

	
