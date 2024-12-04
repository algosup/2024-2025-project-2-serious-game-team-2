extends Control


func _on_settings_pressed() -> void:
	add_child(Global.settings.instantiate())
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_play_pressed() -> void:
	Global.change_scene("res://scenes/map.tscn")
	pass
