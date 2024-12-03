extends Node

# Variable pour stocker le chemin de la scène précédente
var prev_scene : String = ""

# Méthode pour changer de scène en enregistrant la scène actuelle
func change_scene(new_scene: String) -> void:
	prev_scene = get_tree().current_scene.filename
	get_tree().change_scene(new_scene)

# Méthode pour revenir à la scène précédente
func go_back() -> void:
	if prev_scene != "":
		get_tree().change_scene(prev_scene)
	else:
		print("Pas de scène précédente enregistrée !")
