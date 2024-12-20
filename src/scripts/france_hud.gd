extends Node2D

@onready var gdp_bar = $ProgressBar/GDP
@onready var emissions_bar = $ProgressBar/global_emissions
@onready var rd_bar = $"ProgressBar/R&D_progress"
@onready var bus_value_bar = $countrydata/Bus
@onready var car_value_bar = $countrydata/Car
@onready var cement_value_bar = $countrydata/Cement
@onready var metal_value_bar = $countrydata/Metal
@onready var nuclear_value_bar = $countrydata/Nuclear

@onready var gdp_value_label = $ProgressBar/GDP/GDPValue
@onready var emissions_value_label = $ProgressBar/global_emissions/EmissionsValue
@onready var rd_value_label = $"ProgressBar/R&D_progress/RDValue"
@onready var bus_value_label = $countrydata/Bus/BusValue
@onready var car_value_label = $countrydata/Car/CarValue
@onready var cement_value_label = $countrydata/Cement/CementValue
@onready var metal_value_label = $countrydata/Metal/MetalValue
@onready var nuclear_value_label = $countrydata/Nuclear/NuclearValue

@onready var popup_label = $Label
@onready var popup_timer = $Timer  # Replace with the correct path to your timer node

var icons = []  # Array to hold the icons/buttons
var map_bounds = Rect2(650, 100, 250, 250)  # Adjust to your map area
var min_spacing = 50  # Minimum distance between buttons
var tooltip_node
var tooltip2_node
var tooltip3_node

# Dictionary to store scene paths
var scene_paths = {
	"Bus": "res://scenes/questions_bus.tscn",
	"Nuclear": "res://scenes/questions_nuclear.tscn",
	"Car": "res://scenes/questions_car.tscn",
	"Cement": "res://scenes/questions_cement.tscn",
	"Metal": "res://scenes/questions_metal.tscn"
}

# Track button states to prevent repeated timer triggers
var button_states = {
	"Bus": false,
	"Car": false,
	"Cement": false,
	"Metal": false,
	"Nuclear": false
}

func _ready():
	popup_label.visible = false  # Ensure the label is hidden initially

	# Show the label when the scene is loaded
	popup_label.visible = true
	popup_timer.start(3)  # Start the timer for 30 seconds

	# Load the saved state when the HUD is opened
	var saved_state = Global.load_france_hud_state()
	gdp_bar.value = saved_state["GDP"]
	emissions_bar.value = saved_state["Emissions"]
	rd_bar.value = saved_state["R&D"]
	bus_value_bar.value = saved_state["BusValue"]
	car_value_bar.value = saved_state["CarValue"]
	cement_value_bar.value = saved_state["CementValue"]
	metal_value_bar.value = saved_state["MetalValue"]
	nuclear_value_bar.value = saved_state["NuclearValue"]

	# Initialize the icons
	icons = [$France/Bus, $France/Nuclear, $France/Car, $France/Cement, $France/Metal]

	# Reference tooltip nodes
	tooltip_node = $ProgressBar/GDP/tooltip
	tooltip2_node = $ProgressBar/global_emissions/tooltip2
	tooltip3_node = $"ProgressBar/R&D_progress/tooltip3"
	tooltip_node.hide()
	tooltip2_node.hide()
	tooltip3_node.hide()

	# Initialize the progress bar value labels
	update_progress_label(gdp_bar, gdp_value_label)
	update_progress_label(emissions_bar, emissions_value_label)
	update_progress_label(rd_bar, rd_value_label)
	update_progress_label(bus_value_bar, bus_value_label)
	update_progress_label(car_value_bar, car_value_label)
	update_progress_label(cement_value_bar, cement_value_label)
	update_progress_label(metal_value_bar, metal_value_label)
	update_progress_label(nuclear_value_bar, nuclear_value_label)

	# Configure timers
	$France/BusTimer.wait_time = 10
	$France/CarTimer.wait_time = 15
	$France/CementTimer.wait_time = 20
	$France/MetalTimer.wait_time = 25
	$France/NuclearTimer.wait_time = 30

	$France/BusTimer.stop()
	$France/CarTimer.stop()
	$France/CementTimer.stop()
	$France/MetalTimer.stop()
	$France/NuclearTimer.stop()

	# Start GDP increment timer
	$GDP_Timer.wait_time = 6
	$GDP_Timer.start()
	
	# Connect timers to respective signals
	$France/BusTimer.connect("timeout", Callable(self, "_on_bus_timer_timeout"))
	$France/CarTimer.connect("timeout", Callable(self, "_on_car_timer_timeout"))
	$France/CementTimer.connect("timeout", Callable(self, "_on_cement_timer_timeout"))
	$France/MetalTimer.connect("timeout", Callable(self, "_on_metal_timer_timeout"))
	$France/NuclearTimer.connect("timeout", Callable(self, "_on_nuclear_timer_timeout"))


	# Place icons randomly
	place_icons_randomly()
	
func _on_timer_timeout() -> void:
	popup_label.visible = false  # Hide the label after 30 seconds
	
func apply_effects(effects: Dictionary):
	if effects.has("GDP"):
		gdp_bar.value = clamp(gdp_bar.value + effects["GDP"], gdp_bar.min_value, gdp_bar.max_value)
		update_progress_label(gdp_bar, gdp_value_label)
	if effects.has("R&D"):
		rd_bar.value = clamp(rd_bar.value + effects["R&D"], rd_bar.min_value, rd_bar.max_value)
		update_progress_label(rd_bar, rd_value_label)
	if effects.has("BusValue"):
		bus_value_bar.value = clamp(bus_value_bar.value + effects["BusValue"], bus_value_bar.min_value, bus_value_bar.max_value)
		update_progress_label(bus_value_bar, bus_value_label)
	if effects.has("CarValue"):
		car_value_bar.value = clamp(car_value_bar.value + effects["CarValue"], car_value_bar.min_value, car_value_bar.max_value)
		update_progress_label(car_value_bar, car_value_label)
	if effects.has("CementValue"):
		cement_value_bar.value = clamp(cement_value_bar.value + effects["CementValue"], cement_value_bar.min_value, cement_value_bar.max_value)
		update_progress_label(cement_value_bar, cement_value_label)
	if effects.has("MetalValue"):
		metal_value_bar.value = clamp(metal_value_bar.value + effects["MetalValue"], metal_value_bar.min_value, metal_value_bar.max_value)
		update_progress_label(metal_value_bar, metal_value_label)
	if effects.has("NuclearValue"):
		nuclear_value_bar.value = clamp(nuclear_value_bar.value + effects["NuclearValue"], nuclear_value_bar.min_value, nuclear_value_bar.max_value)
		update_progress_label(nuclear_value_bar, nuclear_value_label)
	
	# Update emissions based on average of all individual values
	update_emissions_bar()

# GDP increment timer handler
func _on_gdp_timer_timeout():
	gdp_bar.value = clamp(gdp_bar.value + 1, gdp_bar.min_value, gdp_bar.max_value)
	update_progress_label(gdp_bar, gdp_value_label)
	
func update_emissions_bar():
	var total = bus_value_bar.value + car_value_bar.value + cement_value_bar.value + metal_value_bar.value + nuclear_value_bar.value
	var average = total / 5.0  # Average of all individual values
	emissions_bar.value = average
	update_progress_label(emissions_bar, emissions_value_label)

func update_progress_label(progress_bar: ProgressBar, label_node: Label):
	if progress_bar and label_node:
		var percentage = progress_bar.value / progress_bar.max_value * 100.0
		percentage = floor(percentage * 10 + 0.5) / 10  # Round to 1 decimal place
		label_node.text = str(percentage) + "%"
		
# Place icons randomly on the map
func place_icons_randomly():
	var placed_positions = []  # Track already placed positions
	for icon in icons:
		if icon:  # Ensure the icon exists
			var new_position = generate_unique_position(placed_positions)
			icon.position = new_position
			placed_positions.append(new_position)  # Prevent overlap
			icon.visible = true  # Ensure visibility
		else:
			print("Error: Icon is not valid!")

# Generate unique positions for icons
func generate_unique_position(placed_positions: Array) -> Vector2:
	var max_attempts = 100  # Avoid infinite loops
	for attempt in range(max_attempts):
		var random_x = randi() % int(map_bounds.size.x) + map_bounds.position.x
		var random_y = randi() % int(map_bounds.size.y) + map_bounds.position.y
		var candidate_position = Vector2(random_x, random_y)

		# Ensure minimum spacing between icons
		var is_valid = true
		for pos in placed_positions:
			if pos.distance_to(candidate_position) < min_spacing:
				is_valid = false
				break

		if is_valid:
			return candidate_position  # Return valid position

	# Fallback: Return a random position if no valid position is found
	print("Warning: Couldn't find a unique position after max attempts.")
	return Vector2(
		map_bounds.position.x + randi() % int(map_bounds.size.x),
		map_bounds.position.y + randi() % int(map_bounds.size.y)
	)

# Instantiate a scene dynamically
func instantiate_scene(button_name: String, button_node):
	var scene_path = scene_paths.get(button_name, null)  # Get the scene path
	print("Instantiating scene for:", button_name, "Scene Path:", scene_path)  # Debugging

	if scene_path:
		var scene_resource = ResourceLoader.load(scene_path)  # Load the resource dynamically
		if scene_resource:
			print("Scene resource loaded successfully for:", button_name)  # Debugging
			var scene_instance = scene_resource.instantiate()  # Instantiate the loaded resource
			add_child(scene_instance)
			button_node.hide()
			button_states[button_name] = true  # Mark the button as clicked
		else:
			print("Error: Could not load resource at path:", scene_path)  # Debugging
	else:
		print("Error: Scene path for", button_name, "not found!")  # Debugging

# Button Press Handlers
func _on_nuclear_pressed() -> void:
	if not button_states["Nuclear"]:
		print("Nuclear button pressed")
		instantiate_scene("Nuclear", $France/Nuclear)
		$France/NuclearTimer.start()

func _on_bus_pressed() -> void:
	if not button_states["Bus"]:
		print("Bus button pressed")
		instantiate_scene("Bus", $France/Bus)
		$France/BusTimer.start()

func _on_car_pressed() -> void:
	if not button_states["Car"]:
		print("Car button pressed")
		instantiate_scene("Car", $France/Car)
		$France/CarTimer.start()

func _on_cement_pressed() -> void:
	if not button_states["Cement"]:
		print("Cement button pressed")
		instantiate_scene("Cement", $France/Cement)
		$France/CementTimer.start()

func _on_metal_pressed() -> void:
	if not button_states["Metal"]:
		print("Metal button pressed")
		instantiate_scene("Metal", $France/Metal)
		$France/MetalTimer.start()

# Timer Timeout Handlers
func _on_bus_timer_timeout():
	print("Re-adding Bus button")
	re_add_button($France/Bus, "Bus")

func _on_car_timer_timeout():
	print("Re-adding Car button")
	re_add_button($France/Car, "Car")

func _on_cement_timer_timeout():
	print("Re-adding Cement button")
	re_add_button($France/Cement, "Cement")

func _on_metal_timer_timeout():
	print("Re-adding Metal button")
	re_add_button($France/Metal, "Metal")

func _on_nuclear_timer_timeout():
	print("Re-adding Nuclear button")
	re_add_button($France/Nuclear, "Nuclear")

# Re-add a button to the scene
func re_add_button(button_node, button_name):
	button_node.visible = true
	button_node.position = generate_unique_position([])
	button_states[button_name] = false  # Mark the button as active again
	print("Button re-added:", button_node.name)

# Tooltip logic for GDP
func _on_gdp_mouse_entered() -> void:
	tooltip_node.show()

func _on_gdp_mouse_exited() -> void:
	tooltip_node.hide()

# Tooltip logic for Global Emissions
func _on_global_emissions_mouse_entered() -> void:
	tooltip2_node.show()

func _on_global_emissions_mouse_exited() -> void:
	tooltip2_node.hide()

# Tooltip logic for R&D Progress
func _on_rd_progress_mouse_entered() -> void:
	tooltip3_node.show()

func _on_rd_progress_mouse_exited() -> void:
	tooltip3_node.hide()

func _on_back_button_pressed() -> void:
	Global.save_france_hud_state(
	gdp_bar.value, 
	emissions_bar.value, 
	rd_bar.value, 
	bus_value_bar.value, 
	car_value_bar.value, 
	cement_value_bar.value, 
	metal_value_bar.value, 
	nuclear_value_bar.value
)
	Global.change_scene("res://scenes/map.tscn")
