extends Control


func _on_back_button_pressed() -> void:
	queue_free()

	

func _on_h_slider_value_changed(value: float) -> void:
	Global.set_volume(value)
