extends Control

# Declare variables
var _collision_image: Image

@onready var _collision_sprite = $Node2D/collision
@onready var _france_sprite = $Node2D/Node2D/france
@onready var _germany_sprite = $Node2D/Node2D/germany
@onready var _spain_sprite = $Node2D/Node2D/spain
@onready var _label = $Label

# Map red-channel values to countries
const COUNTRY_MAP = {
	1: "France",
	2: "Spain",
	3: "Germany"
}

func _ready():
	# Ensure the collision texture is converted to an image
	if _collision_sprite.texture and _collision_sprite.texture is Texture2D:
		_collision_image = _collision_sprite.texture.get_image()
	else:
		push_error("Collision sprite texture is missing or invalid.")

	# Hide all country-specific sprites initially
	_france_sprite.visible = false
	_germany_sprite.visible = false
	_spain_sprite.visible = false

func _process(_delta):
	# Get mouse position relative to the collision sprite
	var mouse_pos = _collision_sprite.get_local_mouse_position()

	# Map mouse position to the collision map's pixel space
	var texture_size = _collision_sprite.texture.get_size()
	var collision_size = _collision_image.get_size()
	var pixel_pos = Vector2(
		int(mouse_pos.x * collision_size.x / texture_size.x),
		int(mouse_pos.y * collision_size.y / texture_size.y)
	)

	# Ensure the mapped position is within bounds
	if pixel_pos.x >= 0 and pixel_pos.y >= 0 and pixel_pos.x < collision_size.x and pixel_pos.y < collision_size.y:
		var pixel = _collision_image.get_pixelv(pixel_pos)
		var red_value = pixel.r8

		# Update hover layer based on red value
		if red_value in COUNTRY_MAP:
			update_hovered_country(red_value)
		else:
			reset_hovered_country()
	else:
		reset_hovered_country()

func _unhandled_input(event):
	# Handle mouse clicks
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = _collision_sprite.get_local_mouse_position()

		# Map mouse position to the collision map's pixel space
		var texture_size = _collision_sprite.texture.get_size()
		var collision_size = _collision_image.get_size()
		var pixel_pos = Vector2(
			int(mouse_pos.x * collision_size.x / texture_size.x),
			int(mouse_pos.y * collision_size.y / texture_size.y)
		)

		# Ensure the mapped position is within bounds
		if pixel_pos.x >= 0 and pixel_pos.y >= 0 and pixel_pos.x < collision_size.x and pixel_pos.y < collision_size.y:
			var pixel = _collision_image.get_pixelv(pixel_pos)
			var red_value = pixel.r8

			# Detect and handle clicked country
			if red_value in COUNTRY_MAP:
				var country_name = COUNTRY_MAP[red_value]
				handle_country_click(country_name)

func update_hovered_country(red_value):
	# Show the appropriate country layer based on red value
	match red_value:
		1:  # France
			_france_sprite.visible = true
			_germany_sprite.visible = false
			_spain_sprite.visible = false
		2:  # Spain
			_france_sprite.visible = false
			_germany_sprite.visible = false
			_spain_sprite.visible = true
		3:  # Germany
			_france_sprite.visible = false
			_germany_sprite.visible = true
			_spain_sprite.visible = false

func reset_hovered_country():
	# Hide all country-specific sprites
	_france_sprite.visible = false
	_germany_sprite.visible = false
	_spain_sprite.visible = false

func handle_country_click(country_name):
	# Logic to handle a specific country being clicked
	print("Clicked on:", country_name)
	_label.text = "Clicked: " + country_name

	# Example: Add further logic here
	if country_name == "France":
		print("France is clicked! Execute France-specific logic.")
		# Add your France-specific code here
	elif country_name == "Spain":
		print("Spain is clicked! Execute Spain-specific logic.")
		# Add your Spain-specific code here
	elif country_name == "Germany":
		print("Germany is clicked! Execute Germany-specific logic.")
		# Add your Germany-specific code here
