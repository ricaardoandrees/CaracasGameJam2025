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
	self.global_position.x += 141
	pass # Replace with function body.

func _process(delta):
	pass
	

func _physics_process(delta: float) -> void:
	if contador == 1:
		print("aaaaa")
		print(self.global_position)
	contador+= 1
	position.x += 4 * DIRECTION
	
