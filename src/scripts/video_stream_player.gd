extends VideoStreamPlayer

var loop_start: float = 0.0
var loop_end: float = 20.0

func _process(delta: float) -> void:
	if is_playing():
		# Use the `playback_position` property to get the current playback time
		var playback_position: float = playback_position
		if playback_position >= loop_end:
			seek(loop_start)
