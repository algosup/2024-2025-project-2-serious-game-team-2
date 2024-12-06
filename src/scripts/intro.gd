extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(6.0).timeout
	
	# Start fade-out animation
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	
	# Change the scene after the fade-out finishes
	change_to_home()

# Function to change to the home screen
func change_to_home():
	# Add a short delay to ensure smooth transition
	await get_tree().create_timer(0.2).timeout
	add_child(Global.home_screen.instantiate())
