extends Node

# Preload scenes
var settings = preload("res://scenes/settings.tscn")
var map = preload("res://scenes/map.tscn")
var home_screen = preload("res://scenes/home_screen.tscn")
var france_hud = preload("res://scenes/france_hud.tscn")

# Audio Players for music
var intro_music = preload("res://assets/audio/intro.mp3")  # Replace with your intro music path
var home_screen_music = preload("res://assets/audio/home.mp3")  # Replace with your home screen music path
var game_music = preload("res://assets/audio/game_music.mp3")  # Replace with your game music path

var music_player: AudioStreamPlayer
var current_volume: float = 1.0  # Default volume level (range: 0.0 - 1.0)

func _ready():
	# Create an AudioStreamPlayer node to handle music
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	update_music_volume()  # Apply the initial volume

	# Start intro music
	play_music(intro_music)

# Change scenes and adjust music
func change_scene(scene_path: String) -> void:
	if scene_path == "res://scenes/home_screen.tscn" :
		play_music(home_screen_music)
	elif scene_path == "res://scenes/map.tscn" or scene_path == "res://scenes/france_hud.tscn":
		play_music(game_music)


	# Change to the requested scene
	get_tree().change_scene_to_file(scene_path)

# Play music
func play_music(music: AudioStream):
	if music_player.stream != music:
		music_player.stream = music
		music_player.play()

# Update volume
func set_volume(volume: float):
	current_volume = clamp(volume, 0.0, 1.0)  # Clamp volume between 0 and 1
	update_music_volume()

# Helper to update the music volume
func update_music_volume():
	# Convert volume from linear scale (0.0 to 1.0) to decibels for AudioStreamPlayer
	music_player.volume_db = linear_to_db(current_volume)

# Convert linear scale to decibels (helper function if linear_to_db isn't available)
func linear_to_db(value: float) -> float:
	if value <= 0.0:
		return -80.0  # Minimum decibel value in Godot
	return 20.0 * linear_to_db(value)
