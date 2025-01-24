extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D


const SPEED = 100.0
const JUMP_VELOCITY = -200.0
var DIRECTION = 1
var had_jump: bool= false
var maxjumps: int = 2
var actualjumps: int = 0
@onready var balla_burbuja = preload("res://Scenes/balla_burbuja.tscn")
var presionado: bool = false


func _ready():
	pass


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
		
	if Input.is_action_pressed("inflar"):
		animated_sprite_2d.play("inflar")
	elif Input.is_action_just_released("inflar"):
			animated_sprite_2d.stop()
	if Input.is_action_pressed("suicidarse"):
		animated_sprite_2d.play("muerte")


		



func _input(event):
	if event.is_action_pressed("izquierda"):
		DIRECTION = -1
	if event.is_action_pressed("derecha"):
		DIRECTION = 1
	if event.is_action_pressed("disparar"):
		print("piu piu")
		var instancia = balla_burbuja.instantiate()
		instancia.position = animated_sprite_2d.global_position
		instancia.DIRECTION = DIRECTION
		animated_sprite_2d.scale *= 0.8
		collision_shape_2d.scale *= 0.8
		get_parent().add_child(instancia)
		
		

	
