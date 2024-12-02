extends Camera2D


func _process(delta):
	# Get the mouse position relative to the viewport
	var screen_size = get_viewport().get_visible_rect().size
