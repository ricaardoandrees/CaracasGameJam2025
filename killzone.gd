extends Area2D


func _ready():
	monitoring = true
	
	
func _on_body_entered(body):
	print(typeof(body))
	if(body.name == "PlayerBurbuja"):
		get_tree().reload_current_scene()


func _on_area_entered(area):
	get_parent().queue_free()
