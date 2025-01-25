extends Area2D

func _on_body_entered(body):
	print(typeof(body))
	if(body.name == "PlayerBurbuja"):
		get_tree().reload_current_scene()
