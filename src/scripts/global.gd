extends Node

var settings = preload("res://scenes/settings.tscn")
var map = preload("res://scenes/map.tscn")
var home_screen = preload("res://scenes/home_screen.tscn")
var france_hud = preload("res://scenes/france_hud.tscn")

func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
