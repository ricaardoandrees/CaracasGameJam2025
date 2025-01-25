extends Area2D

@onready var player 

func _on_body_entered(body):
	if body is CharacterBody2D:  
		player = body
		if player.little:  
			player.animated_sprite_2d.scale = player.escalaINICIAL  
			player.collision_shape_2d.scale = player.escalaINICIAL  
			player.little = false  
			player.contador_disparos = 0 
			print("Tamaño restaurado al tamaño inicial:", player.escalaINICIAL)
			queue_free()
