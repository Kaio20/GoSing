extends Control
var VideoPlayer: VideoStreamPlayer
var VideoPlayerLabel: Label
var video_bus_index: int

func _ready() -> void:
	video_bus_index = AudioServer.get_bus_index("Video")
	VideoPlayerLabel.text = VideoPlayer.get_stream_name()
	
func _on_button_pressed() -> void:
	VideoPlayer.set_paused(not VideoPlayer.is_paused())


func _on_video_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(video_bus_index, linear_to_db(value))
	%video_volume_slider_text.text = str(value*100).pad_zeros(3)
	


# https://docs.godotengine.org/en/stable/classes/class_videostreamplayer.html


func _on_stop_button_pressed() -> void:
	VideoPlayer.stop()
	VideoPlayer.visible = false #DEBUG hier eine schöne fade out animation und langsam die Musik runterregeln
	pass # Replace with function body.
