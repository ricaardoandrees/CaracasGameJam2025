extends Area2D
@onready var animated_sprite_2d = $"../AnimatedSprite2D"


func _ready():
	monitoring = true
	
func _on_body_entered(body):
	print(typeof(body))
	if(body.name == "PlayerBurbuja"):
		body.muelto()
		if not (animated_sprite_2d == null):
			animated_sprite_2d.play("ataque")
		


func _on_area_entered(area):
	animated_sprite_2d.play("muerte")
