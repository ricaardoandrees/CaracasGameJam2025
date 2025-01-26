extends CanvasLayer

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("pausa"):
		get_tree().paused= not get_tree().paused
		$ColorRect.visible= not $ColorRect.visible
		$TextEdit.visible= not $TextEdit.visible
		$Menu.visible= not $Menu.visible
		$Controles.visible= not $Controles.visible
		$Salir.visible= not $Salir.visible
	


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_controles_pressed() -> void:
	pass # Replace with function body.


func _on_salir_pressed() -> void:
	get_tree().quit()


#xd
