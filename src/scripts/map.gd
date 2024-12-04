extends Control

# Variables pour la collision et les interactions
var _collision_image: Image

@onready var _collision_sprite = $Node2D/collision
@onready var _france_sprite = $Node2D/Node2D/france
@onready var _germany_sprite = $Node2D/Node2D/germany
@onready var _spain_sprite = $Node2D/Node2D/spain
@onready var _label = $Label

# Mapping des valeurs de couleur aux pays
const COUNTRY_MAP = {
	1: "France",
	2: "Spain",
	3: "Germany"
}

func _ready():
	if _collision_sprite.texture and _collision_sprite.texture is Texture2D:
		_collision_image = _collision_sprite.texture.get_image()
	else:
		push_error("Texture de collision manquante ou invalide.")

	_france_sprite.visible = false
	_germany_sprite.visible = false
	_spain_sprite.visible = false

func _process(_delta):
	var mouse_pos = _collision_sprite.get_local_mouse_position()
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
		else:
			reset_hovered_country()
	else:
		reset_hovered_country()

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = _collision_sprite.get_local_mouse_position()
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
				var country_name = COUNTRY_MAP[red_value]
				handle_country_click(country_name)

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
	print("Clicked on:", country_name)
	_label.text = "Clicked: " + country_name

	if country_name == "France":
		get_tree().change_scene_to_file("res://scenes/france_hud.tscn")
	elif country_name == "Spain":
		print("Spain clicked!")
	elif country_name == "Germany":
		print("Germany clicked!")
	



func _on_settings_pressed() -> void:
	add_child(Global.settings.instantiate())
	pass # Replace with function body.
