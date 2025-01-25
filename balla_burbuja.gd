extends Area2D

var DIRECTION = 1
var SPEED = 100
var contador = 1
@onready var animated_sprite_2d = $AnimatedSprite2D

#func _init(direction):
	#print("me creo")
	#DIRECTION = direction
	
# Called when the node enters the scene tree for the first time.
func _ready():
	self.global_position.x += 141
	self.global_position.y -= 5
	animated_sprite_2d.play("default")
	pass # Replace with function body.

func _process(delta):
	pass
	
#func _body_en(area):
	#animated_sprite_2d.play("collision")
	

	
func _on_animated_sprite_animation_finished(animation):
	print("huh")
	if animation == "collision":
		queue_free()

func _physics_process(delta: float) -> void:
	if contador == 1:
		print("aaaaa")
		print(self.global_position)
	contador+= 1
	position.x += 3 * DIRECTION
	


func _on_body_entered(body):
	animated_sprite_2d.play("collision")


func _on_area_entered(area):
	animated_sprite_2d.play("collision")
