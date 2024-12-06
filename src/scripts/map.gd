extends Control

# Variables for collision and interactions
var _collision_image: Image
var _dragging: bool = false  # Track if the map is being dragged
var _drag_start_position: Vector2 = Vector2()  # The starting position of the drag
var _map_offset: Vector2 = Vector2()  # Offset of the map
var _hovered_country: String = ""  # The country currently being hovered
var _clicked_on_country: bool = false  # Indicates if a country was clicked
var _drag_threshold: float = 10.0  # Movement threshold to detect a drag
var _drag_distance: float = 0.0  # Total distance moved

@onready var _map_node = $Node2D  # The Node2D node containing everything to move (collision, countries, outlines)
@onready var _collision_sprite = $Node2D/collision
@onready var _france_sprite = $Node2D/Node2D/france
@onready var _germany_sprite = $Node2D/Node2D/germany
@onready var _spain_sprite = $Node2D/Node2D/spain
@onready var _label = $Label

# Mapping of colors to countries
const COUNTRY_MAP = {
	1: "France",
	2: "Spain",
	3: "Germany"
}

func _ready():
	if _collision_sprite.texture and _collision_sprite.texture is Texture2D:
		_collision_image = _collision_sprite.texture.get_image()
	else:
		push_error("Missing or invalid collision texture.")

	_france_sprite.visible = false
	_germany_sprite.visible = false
	_spain_sprite.visible = false

func _process(_delta):
	# Calculate the mouse position relative to the map offset for collision detection
	var mouse_pos = get_global_mouse_position() - _map_offset  # Subtract map offset to get position relative to the map
	var texture_size = _collision_sprite.texture.get_size()
	var collision_size = _collision_image.get_size()
	var pixel_pos = Vector2(
		int(mouse_pos.x * collision_size.x / texture_size.x),
		int(mouse_pos.y * collision_size.y / texture_size.y)
	)

	# Detect if the mouse is over a country, considering the map offset
	if pixel_pos.x >= 0 and pixel_pos.y >= 0 and pixel_pos.x < collision_size.x and pixel_pos.y < collision_size.y:
		var pixel = _collision_image.get_pixelv(pixel_pos)
		var red_value = pixel.r8

		if red_value in COUNTRY_MAP:
			update_hovered_country(red_value)
			_hovered_country = COUNTRY_MAP[red_value]  # Store the hovered country
		else:
			reset_hovered_country()
			_hovered_country = ""  # Reset the hovered country
	else:
		reset_hovered_country()
		_hovered_country = ""  # Reset the hovered country

	# Move the map and everything inside it if the user is dragging
	if _dragging:
		var current_mouse_pos = get_global_mouse_position()  # Get the global mouse position
		var delta_position = current_mouse_pos - _drag_start_position  # Calculate the mouse movement
		_map_offset += delta_position  # Update the map offset
		_map_node.position = _map_offset  # Apply the offset to the map's position
		_drag_start_position = current_mouse_pos  # Update the starting position for the next frame

		# Calculate the total distance moved to check if the map has been dragged
		_drag_distance += delta_position.length()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Start dragging the map with the left mouse button
				_dragging = true
				_drag_start_position = get_global_mouse_position()  # Store the starting mouse position
				_clicked_on_country = _hovered_country != ""  # Check if a country was clicked
				_drag_distance = 0.0  # Reset the drag distance
			else:
				# Stop dragging when the mouse button is released
				_dragging = false

				# Check if the map hasn't been moved (distance < threshold)
				if _drag_distance < _drag_threshold and _clicked_on_country and _hovered_country != "":
					handle_country_click(_hovered_country)  # Change scene if the map is stationary

				_clicked_on_country = false  # Reset the clicked state

func update_hovered_country(red_value):
	match red_value:
		1:
			_france_sprite.visible = true
			_germany_sprite.visible = false
			_spain_sprite.visible = false
		2:
			_france_sprite.visible = false
			_germany_sprite.visible = false
			_spain_sprite.visible = true
		3:
			_france_sprite.visible = false
			_germany_sprite.visible = true
			_spain_sprite.visible = false

func reset_hovered_country():
	_france_sprite.visible = false
	_germany_sprite.visible = false
	_spain_sprite.visible = false

func handle_country_click(country_name):
	# Only proceed if the map hasn't been moved much (checked by _drag_distance threshold)
	if _drag_distance < _drag_threshold:
		print("Clicked on:", country_name)
		_label.text = "Clicked: " + country_name

		# Delay the scene change to avoid errors
		if country_name == "France":
			# Change the scene only when it's safe
			get_tree().change_scene_to_file("res://scenes/france_hud.tscn")
		elif country_name == "Spain":
			print("Spain clicked!")
		elif country_name == "Germany":
			print("Germany clicked!")

func _on_settings_pressed() -> void:
	add_child(Global.settings.instantiate())
	pass  # Replace with the function body
