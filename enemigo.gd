extends Node2D
@onready var ray_cast_dere_piso = $killzone/RayCastDerePiso
@onready var ray_cast_izq_piso = $killzone/RayCastIZQPiso
@onready var ray_cast_dere = $killzone/RayCastDere
@onready var ray_cast_izq = $killzone/RayCastIzq
@onready var killzone = $killzone



var direction = 1

func _process(delta):
	if (ray_cast_dere.is_colliding()) or ( not ray_cast_dere_piso.is_colliding()):
		direction = -1
	if (ray_cast_izq.is_colliding()) or ( not ray_cast_izq_piso.is_colliding()):
		direction = 1
	position.x += delta * direction * 60
	
	
