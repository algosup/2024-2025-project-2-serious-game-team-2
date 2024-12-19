extends Node2D

@onready var question_label = $questions
@onready var yes_button = $yes/yes
@onready var no_button = $no/no
@onready var effects_label = $effects

var current_question: Dictionary

func _ready():
	# Fetch and display the current question
	current_question = Global.get_random_question("Bus")
	if current_question:
		question_label.text = current_question["text"]

	# Make sure the effects label is initially hidden
	effects_label.visible = false

func _on_yes_pressed():
	apply_question_effects("Yes")

func _on_no_pressed():
	apply_question_effects("No")

func apply_question_effects(choice: String):
	if current_question:
		# Determine effects and output based on choice
		var effects = current_question["effects"].get(choice, {})
		var output = current_question["output"].get(choice, "No additional information.")

		# Display the effects of the choice
		var effects_text = output + "\n\n"
		effects_text += "GDP: " + str(effects.get("GDP", 0)) + "\n"
		effects_text += "R&D Progress: " + str(effects.get("R&D", 0)) + "\n"
		effects_text += "Bus Value: " + str(effects.get("BusValue", 0)) + "\n"

		# Update the effects label text
		effects_label.text = effects_text
		effects_label.visible = true

		# Apply effects to progress bars in france_hud
		var france_hud = get_node("/root/Node2D")  # Adjust path if needed
		if france_hud and france_hud.has_method("apply_effects"):
			france_hud.apply_effects(effects)
		else:
			print("Error: FranceHUD not found or apply_effects method missing.")

	# Hide the buttons and question label after a choice is made
	yes_button.visible = false
	no_button.visible = false
	question_label.visible = false





func _on_back_button_bus_pressed() -> void:
	queue_free()
	pass # Replace with function body.
