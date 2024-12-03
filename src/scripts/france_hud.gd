extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func handle_click_back_button(back_button):

	# Example: Add further logic here
	if back_button == :
		get_tree().change_scene_to_file("res://scenes/france_hud.tscn")
