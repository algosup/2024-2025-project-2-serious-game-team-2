extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timer_timeout():
	$Label/GDP.value+=1 # Replace with function body.
	$Label/"R&D_Progress".value+=1 # Replace with function body.
	$Label/Global_Emissions.value+=1 # Replace with function body.
