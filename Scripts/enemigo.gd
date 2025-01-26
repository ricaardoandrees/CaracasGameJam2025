extends Node2D
@onready var ray_cast_dere_piso = $killzone/RayCastDerePiso
@onready var ray_cast_izq_piso = $killzone/RayCastIZQPiso
@onready var ray_cast_dere = $killzone/RayCastDere
@onready var ray_cast_izq = $killzone/RayCastIzq
@onready var killzone = $killzone
@onready var ray_cast_arr = $killzone/RayCastArr
@onready var animated_sprite_2d = $AnimatedSprite2D



var direction = 1

func _ready():
	animated_sprite_2d.play("idle")


func _process(delta):
	if (ray_cast_dere.is_colliding()) or ( not ray_cast_dere_piso.is_colliding()):
		direction = -1
		animated_sprite_2d.flip_h = false
	if (ray_cast_izq.is_colliding()) or ( not ray_cast_izq_piso.is_colliding()):
		direction = 1
		animated_sprite_2d.flip_h = true
	position.x += delta * direction * 60
	print("aaaa")
	print(animated_sprite_2d.animation)
	if not animated_sprite_2d.is_playing():
		queue_free()
	


	

	
	
