extends Area2D

var DIRECTION = 1
var SPEED = 100
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
	position.x += 4 * DIRECTION
	
