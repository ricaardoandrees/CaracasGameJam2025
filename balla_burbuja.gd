extends Area2D

var DIRECTION = 1
var SPEED = 100
var contador = 1
#
#func _init(direction):
	#print("me creo")
	#DIRECTION = direction
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass
	

func _physics_process(delta: float) -> void:
	print("fiscas recargadas")
	print(contador)
	contador+= 1
	position.x += 4 * DIRECTION
	
