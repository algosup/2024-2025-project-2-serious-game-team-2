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
@onready var _france_green = $Node2D/Node2D/francegreen  # Green France sprite node
@onready var _france_yellow = $Node2D/Node2D/franceyellow  # Yellow France sprite node
@onready var _france_orange = $Node2D/Node2D/franceorange  # Orange France sprite node
@onready var _france_red = $Node2D/Node2D/francered  # Red France sprite node
@onready var _germany_sprite = $Node2D/Node2D/germany
@onready var _spain_sprite = $Node2D/Node2D/spain
@onready var _label = $Label

# Mapping of colors to countries
const COUNTRY_MAP = {
	1: "France",
	2: "Spain",
	3: "Germany"
}

# Define thresholds for colors
const COLOR_THRESHOLDS = {
	"green": {"GDP": 80, "Emissions": 30},
	"yellow": {"GDP": 50, "Emissions": 50},
	"orange": {"GDP": 30, "Emissions": 70},
	"red": {"GDP": 10, "Emissions": 90}
}

# Scene paths for dynamic instantiation
var scene_paths = {
	"France": "res://scenes/france_hud.tscn",
	"Spain": "res://scenes/spain_hud.tscn",
	"Germany": "res://scenes/germany_hud.tscn"
}

# Button states to track if a button has been clicked
var button_states = {
	"France": false
}

func _ready():
	if _collision_sprite.texture and _collision_sprite.texture is Texture2D:
		_collision_image = _collision_sprite.texture.get_image()
	else:
		push_error("Missing or invalid collision texture.")

	# Ensure only the appropriate France sprite is visible at the start
	reset_france_sprites()

	_germany_sprite.visible = false
	_spain_sprite.visible = false

	# Update France's sprite color based on global state
	update_france_sprite_color()

func update_france_sprite_color():
	var state = Global.load_france_hud_state()
	var gdp = state["GDP"]
	var emissions = state["Emissions"]
	var color = determine_color(gdp, emissions)
	switch_france_sprite(color)

func _update_france_color():
	# Only update the France sprite if the hovered country is France
	if _hovered_country == "France":
		# Fetch values from Global
		var values = Global.get_france_hud_values()
		if values.has("GDP") and values.has("Emissions"):
			var gdp_value = values["GDP"]
			var emissions_value = values["Emissions"]

			# Determine the color based on thresholds
			var color = determine_color(gdp_value, emissions_value)
			switch_france_sprite(color)
		else:
			print("Error: Could not fetch values for France HUD.")

func determine_color(gdp, emissions) -> String:
	if gdp >= COLOR_THRESHOLDS["green"]["GDP"] and emissions <= COLOR_THRESHOLDS["green"]["Emissions"]:
		return "green"
	elif gdp >= COLOR_THRESHOLDS["yellow"]["GDP"] and emissions <= COLOR_THRESHOLDS["yellow"]["Emissions"]:
		return "yellow"
	elif gdp >= COLOR_THRESHOLDS["orange"]["GDP"] and emissions <= COLOR_THRESHOLDS["orange"]["Emissions"]:
		return "orange"
	else:
		return "red"

# Reset all France sprite nodes to invisible
func reset_france_sprites():
	_france_green.visible = false
	_france_yellow.visible = false
	_france_orange.visible = false
	_france_red.visible = false

# Show the appropriate France sprite based on the determined color
func switch_france_sprite(color: String):
	reset_france_sprites()  # Hide all sprites first
	match color:
		"green":
			_france_green.visible = true
		"yellow":
			_france_yellow.visible = true
		"orange":
			_france_orange.visible = true
		"red":
			_france_red.visible = true

func _process(_delta):
	var mouse_pos = get_global_mouse_position() - _map_offset
	var texture_size = _collision_sprite.texture.get_size()
	var collision_size = _collision_image.get_size()
	var pixel_pos = Vector2(
		int(mouse_pos.x * collision_size.x / texture_size.x),
		int(mouse_pos.y * collision_size.y / texture_size.y)
	)

	if pixel_pos.x >= 0 and pixel_pos.y >= 0 and pixel_pos.x < collision_size.x and pixel_pos.y < collision_size.y:
		var pixel = _collision_image.get_pixelv(pixel_pos)
		var red_value = pixel.r8

		if red_value in COUNTRY_MAP:
			update_hovered_country(red_value)
			_hovered_country = COUNTRY_MAP[red_value]
			_update_france_color()  # Update France sprite color only when hovering France
		else:
			reset_hovered_country()
			_hovered_country = ""
	else:
		reset_hovered_country()
		_hovered_country = ""

	if _dragging:
		var current_mouse_pos = get_global_mouse_position()
		var delta_position = current_mouse_pos - _drag_start_position
		_map_offset += delta_position
		_map_node.position = _map_offset
		_drag_start_position = current_mouse_pos
		_drag_distance += delta_position.length()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				_dragging = true
				_drag_start_position = get_global_mouse_position()
				_clicked_on_country = _hovered_country != ""
				_drag_distance = 0.0
			else:
				_dragging = false

				if _drag_distance < _drag_threshold and _clicked_on_country and _hovered_country != "":
					handle_country_click(_hovered_country)

				_clicked_on_country = false

func update_hovered_country(red_value):
	match red_value:
		1:  # France
			_france_green.visible = false
			_germany_sprite.visible = false
			_spain_sprite.visible = false
		2:  # Spain
			reset_france_sprites()
			_germany_sprite.visible = false
			_spain_sprite.visible = true
		3:  # Germany
			reset_france_sprites()
			_germany_sprite.visible = true
			_spain_sprite.visible = false

func reset_hovered_country():
	# Hide all country sprites
	reset_france_sprites()
	_germany_sprite.visible = false
	_spain_sprite.visible = false

func handle_country_click(country_name):
	if _drag_distance < _drag_threshold:
		print("Clicked on:", country_name)
		_label.text = "Clicked: " + country_name

		if country_name == "France":
			Global.change_scene("res://scenes/france_hud.tscn")
		elif country_name == "Spain":
			print("Spain clicked!")
		elif country_name == "Germany":
			print("Germany clicked!")
# Properly handle scene changes for settings and home
func _on_settings_pressed() -> void:
	add_child(Global.settings.instantiate())
func _on_home_pressed() -> void:
	# Change the entire scene to home screen
	Global.change_scene("res://scenes/home_screen.tscn")
