extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.





func _on_timer_timeout():
	$Label/GDP.value+=1 # Replace with function body.
	$Label/"R&D_progress".value+=1 # Replace with function body.
	$Label/global_emissions.value+=1 # Replace with function body.


func _on_back_button_pressed() -> void:
	pass # Replace with function body.
