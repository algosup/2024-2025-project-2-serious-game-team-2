extends Node

# Preload scenes
var settings = preload("res://scenes/settings.tscn")
var map = preload("res://scenes/map.tscn")
var home_screen = preload("res://scenes/home_screen.tscn")
var france_hud = preload("res://scenes/france_hud.tscn")

# Audio Players for music
var intro_music = preload("res://assets/audio/intro.mp3")
var home_screen_music = preload("res://assets/audio/home.mp3")
var game_music = preload("res://assets/audio/game_music1.ogg")

var music_player: AudioStreamPlayer
var current_volume: float = 1.0  # Default volume level (range: 0.0 - 1.0)

# France HUD state and instance
var france_hud_state = {
	"GDP": 75.0,
	"Emissions": 50.0,
	"R&D": 60.0,
	"BusValue": 50.0,
	"CarValue": 50.0,
	"CementValue": 50.0,
	"MetalValue": 50.0,
	"NuclearValue": 50.0
}
var france_hud_instance = null  # Declare france_hud_instance globally

# Load the questions script
var Questions = preload("res://scripts/questions.gd")

# Use QUESTIONS from the Questions script
var questions = Questions.QUESTIONS

var answered_questions = {}

func _ready():
	# Ensure France HUD state is initialized correctly
	initialize_france_hud()
	
	# Initialize answered questions tracking
	for key in questions.keys():
		answered_questions[key] = []

	# Create an AudioStreamPlayer node to handle music
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	update_music_volume()

	# Start intro music
	play_music(intro_music)

# Change scenes and adjust music
func change_scene(scene_path: String) -> void:
	if scene_path == "res://scenes/home_screen.tscn":
		play_music(home_screen_music)
	elif scene_path == "res://scenes/map.tscn" or scene_path == "res://scenes/france_hud.tscn":
		play_music(game_music)

	get_tree().change_scene_to_file(scene_path)

# Play music
func play_music(music: AudioStream):
	if music_player.stream != music:
		music_player.stream = music
		music_player.play()

# Update volume
func set_volume(volume: float):
	current_volume = clamp(volume, 0.0, 1.0)
	update_music_volume()

# Helper to update the music volume
func update_music_volume():
	music_player.volume_db = linear_to_db(current_volume)

# Convert linear scale to decibels
func linear_to_db(value: float) -> float:
	if value <= 0.0:
		return -80.0
	return 20.0 * log(value)

# Save France HUD state
func save_france_hud_state(gdp, emissions, r_and_d, bus_value, car_value, cement_value, metal_value, nuclear_value):
	france_hud_state["GDP"] = gdp
	france_hud_state["Emissions"] = emissions
	france_hud_state["R&D"] = r_and_d
	france_hud_state["BusValue"] = bus_value
	france_hud_state["CarValue"] = car_value
	france_hud_state["CementValue"] = cement_value
	france_hud_state["MetalValue"] = metal_value
	france_hud_state["NuclearValue"] = nuclear_value

# Load France HUD state
func load_france_hud_state() -> Dictionary:
	return france_hud_state  # Return the stored state for GDP, Emissions, R&D, and individual values

# Initialize France HUD state and instance
func initialize_france_hud():
	france_hud_instance = france_hud.instantiate()
	get_tree().root.add_child.call_deferred(france_hud_instance)
	france_hud_instance.hide()  # Hide unless explicitly displayed later
	print("France HUD successfully initialized.")
	
# Get values for GDP and emissions from France HUD
func get_france_hud_values() -> Dictionary:
	if france_hud_instance:
		return france_hud_state
	else:
		print("Error: France HUD instance not found.")
		return france_hud_state

# Get random question
func get_random_question(scene: String) -> Dictionary:
	if scene in questions:
		var available_questions = []
		for question in questions[scene]:
			if not question in answered_questions[scene]:
				available_questions.append(question)

		if available_questions.size() > 0:
			var question = available_questions[randi() % available_questions.size()]
			answered_questions[scene].append(question)
			return question

	# Return an empty dictionary if no available questions remain
	return {}

# Reset answered questions for replay/testing purposes
func reset_questions():
	for key in answered_questions.keys():
		answered_questions[key] = []
