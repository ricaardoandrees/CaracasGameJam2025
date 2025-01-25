extends Area2D


func _ready():
	monitoring = true
	
func _on_body_entered(body):
	print(typeof(body))
	if(body.name == "PlayerBurbuja"):
		body.muelto()
		


func _on_area_entered(area):
	get_parent().queue_free()
