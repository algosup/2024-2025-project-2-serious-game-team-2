extends Camera2D

# Zoom speed
var zoom_speed: float = 0.05
var min_zoom: float = 0.2
var max_zoom: float = 3.0

# Store initial touch positions for pinch-to-zoom
var initial_distance: float = 0.0
var zoom_factor: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initialize camera zoom level
	self.zoom = Vector2(1, 1)

# Handle input events
func _input(event):
	# Handle pinch-to-zoom with trackpad or multitouch
	if event is InputEventScreenDrag:
		# Detect two-finger pinch on the trackpad
		if event.touch_count == 2:
			var touch_1 = event.get_touch_position(0)
			var touch_2 = event.get_touch_position(1)

			# Calculate the distance between the two touch points
			var current_distance = touch_1.distance_to(touch_2)

			# If it's the first drag event, initialize the initial distance
			if initial_distance == 0.0:
				initial_distance = current_distance
			else:
				# Calculate the zoom factor based on how the pinch has changed
				zoom_factor = current_distance / initial_distance

				# Adjust zoom based on zoom factor, with clamping to min/max
				zoom.x = clamp(zoom.x * zoom_factor, min_zoom, max_zoom)
				zoom.y = clamp(zoom.y * zoom_factor, min_zoom, max_zoom)

			# Update initial distance to the current distance for next frame
			initial_distance = current_distance

	# Handle arrow key zoom
	if event is InputEventKey and event.pressed:
		# Zoom in when pressing the up arrow
		if event.keycode == KEY_UP:
			zoom_in()
		# Zoom out when pressing the down arrow
		elif event.keycode == KEY_DOWN:
			zoom_out()

# Zoom in
func zoom_in() -> void:
	zoom.x = clamp(zoom.x - zoom_speed, min_zoom, max_zoom)
	zoom.y = clamp(zoom.y - zoom_speed, min_zoom, max_zoom)

# Zoom out
func zoom_out() -> void:
	zoom.x = clamp(zoom.x + zoom_speed, min_zoom, max_zoom)
	zoom.y = clamp(zoom.y + zoom_speed, min_zoom, max_zoom)
