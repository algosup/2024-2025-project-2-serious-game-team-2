extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ensure the settings page is fully loaded if any setup is required
	print("Entered settings from: ", settings.prevscene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Called when the back button is pressed.




func _on_back_button_pressed() -> void:
	if settings.prevscene != "":
		get_tree().change_scene(settings.prevscene)
	else:
		print("No previous scene to return to!")
