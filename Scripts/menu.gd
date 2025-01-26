extends Control

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_instrucciones_pressed() -> void:
	pass


func _on_salir_pressed() -> void:
	get_tree().quit() # Replace with function body.
