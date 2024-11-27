extends Camera2D

# Speed of the camera movement
var move_speed = 400
# Border threshold (distance from screen edges to start moving the camera)
var border_threshold = 10

func _process(delta):
	# Get the mouse position relative to the viewport
	var mouse_pos = get_viewport().get_mouse_position()
	var screen_size = get_viewport().get_visible_rect().size

	# Determine if the mouse is near the edges of the screen
	var move_direction = Vector2()

	if mouse_pos.x <= border_threshold:
		move_direction.x = -1  # Move left
	elif mouse_pos.x >= screen_size.x - border_threshold:
		move_direction.x = 1  # Move right

	if mouse_pos.y <= border_threshold:
		move_direction.y = -1  # Move up
	elif mouse_pos.y >= screen_size.y - border_threshold:
		move_direction.y = 1  # Move down

	# Move the camera smoothly based on the direction
	if move_direction != Vector2.ZERO:
		global_position += move_direction.normalized() * move_speed * delta
