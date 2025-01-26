extends Area2D

@onready var player 

func _on_body_entered(body: Node2D) -> void:
	player = body
	if body is CharacterBody2D:  
		queue_free() # Replace with function body.
		get_tree().change_scene_to_file("res://Scenes/pantalla_ganaste.tscn")
