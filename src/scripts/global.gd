extends Node

# Preload scenes
var settings = preload("res://scenes/settings.tscn")
var map = preload("res://scenes/map.tscn")
var home_screen = preload("res://scenes/home_screen.tscn")
var france_hud = preload("res://scenes/france_hud.tscn")

# Audio Players for music
var intro_music = preload("res://assets/audio/intro.mp3")
var home_screen_music = preload("res://assets/audio/home.mp3")
var game_music = preload("res://assets/audio/game_music.mp3")

var music_player: AudioStreamPlayer
var current_volume: float = 1.0  # Default volume level (range: 0.0 - 1.0)

# Questions dictionary for each scene
var questions = {
	"Bus": [
		{
			"text": "A new law about public transport is in discussion. Apply it?",
			"effects": {
				"Yes": { "GDP": -5, "R&D": 10, "Emissions": -15 },
				"No": { "GDP": 2, "R&D": 0, "Emissions": 5 }
			},
			"output": {
				"Yes": "Your choice encourages greener public transport but increases the budget deficit.",
				"No": "You chose not to apply the law, maintaining the status quo."
			}
		},
		{
			"text": "Increase funding for public transport?",
			"effects": {
				"Yes": { "GDP": -10, "R&D": 5, "Emissions": -20 },
				"No": { "GDP": 3, "R&D": 0, "Emissions": 10 }
			},
			"output": {
				"Yes": "This funding reduces emissions but creates a larger strain on GDP.",
				"No": "You chose not to increase funding, keeping the current policy."
			}
		},
		{
			"text": "Create new bus lanes to reduce traffic congestion?",
			"effects": {
				"Yes": { "GDP": -7, "R&D": 5, "Emissions": -10 },
				"No": { "GDP": 1, "R&D": 0, "Emissions": 3 }
			},
			"output": {
				"Yes": "Bus lanes help reduce congestion but require significant investment.",
				"No": "No new lanes were built, keeping the current infrastructure."
			}
		},
		{
			"text": "Provide subsidies for electric buses?",
			"effects": {
				"Yes": { "GDP": -15, "R&D": 15, "Emissions": -30 },
				"No": { "GDP": 5, "R&D": 0, "Emissions": 10 }
			},
			"output": {
				"Yes": "Subsidies help reduce emissions drastically but cost significant GDP.",
				"No": "No subsidies provided, keeping current emissions unchanged."
			}
		}
	],
	"Nuclear": [
		{
			"text": "Invest in nuclear energy research?",
			"effects": {
				"Yes": { "GDP": -15, "R&D": 25, "Emissions": -30 },
				"No": { "GDP": 5, "R&D": 0, "Emissions": 10 }
			},
			"output": {
				"Yes": "Nuclear research reduces emissions significantly but requires high upfront investment.",
				"No": "No investment in nuclear research, keeping emissions unchanged."
			}
		},
		{
			"text": "Extend the lifespan of existing nuclear plants?",
			"effects": {
				"Yes": { "GDP": -10, "R&D": 10, "Emissions": -20 },
				"No": { "GDP": 2, "R&D": 0, "Emissions": 5 }
			},
			"output": {
				"Yes": "Extended lifespan reduces emissions but increases maintenance costs.",
				"No": "Existing plants remain operational for a limited period."
			}
		}
	],
	"Car": [
		{
			"text": "Introduce tax incentives for electric cars?",
			"effects": {
				"Yes": { "GDP": -10, "R&D": 15, "Emissions": -25 },
				"No": { "GDP": 5, "R&D": 0, "Emissions": 10 }
			},
			"output": {
				"Yes": "Tax incentives promote electric cars, reducing emissions but affecting GDP.",
				"No": "No incentives provided, leaving emissions unchanged."
			}
		},
		{
			"text": "Mandate stricter emissions standards for vehicles?",
			"effects": {
				"Yes": { "GDP": -5, "R&D": 10, "Emissions": -15 },
				"No": { "GDP": 2, "R&D": 0, "Emissions": 5 }
			},
			"output": {
				"Yes": "Stricter standards improve air quality but increase manufacturing costs.",
				"No": "No new standards were implemented, keeping current emissions unchanged."
			}
		}
	],
	"Cement": [
		{
			"text": "Adopt new eco-friendly cement technology?",
			"effects": {
				"Yes": { "GDP": -20, "R&D": 20, "Emissions": -10 },
				"No": { "GDP": 3, "R&D": 0, "Emissions": 5 }
			},
			"output": {
				"Yes": "Eco-friendly cement reduces emissions but significantly impacts GDP.",
				"No": "No investment in eco-friendly technology, keeping emissions unchanged."
			}
		},
		{
			"text": "Subsidize green building materials?",
			"effects": {
				"Yes": { "GDP": -15, "R&D": 15, "Emissions": -25 },
				"No": { "GDP": 5, "R&D": 0, "Emissions": 10 }
			},
			"output": {
				"Yes": "Subsidies promote sustainable building practices but cost GDP.",
				"No": "No subsidies provided, leaving current practices unchanged."
			}
		}
	],
	"Metal": [
		{
			"text": "Subsidize metal recycling programs?",
			"effects": {
				"Yes": { "GDP": -8, "R&D": 10, "Emissions": -18 },
				"No": { "GDP": 3, "R&D": 0, "Emissions": 5 }
			},
			"output": {
				"Yes": "Metal recycling helps emissions but requires moderate investment.",
				"No": "No subsidies provided, leaving emissions unchanged."
			}
		},
		{
			"text": "Invest in low-emission steel production?",
			"effects": {
				"Yes": { "GDP": -12, "R&D": 20, "Emissions": -30 },
				"No": { "GDP": 5, "R&D": 0, "Emissions": 10 }
			},
			"output": {
				"Yes": "Low-emission steel production reduces emissions but requires high investment.",
				"No": "No investment in low-emission production, keeping emissions unchanged."
			}
		}
	]
}


# Track answered questions
var answered_questions = {}

func _ready():
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
	return 20.0 * linear_to_db(value)

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
