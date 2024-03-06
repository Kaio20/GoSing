extends Control
@onready var volume_bar = %volume_bar
@onready var volume_text = %volume_text

var record_bus_index: int
var mute_bus_index: int
var samples = []

func _ready() -> void:
	record_bus_index = AudioServer.get_bus_index("Record")
	mute_bus_index = AudioServer.get_bus_index("Mute")
	%volume_slider.value = db_to_linear(AudioServer.get_bus_volume_db(mute_bus_index))
	
func _process(delta: float) -> void:
	var sample = remap(AudioServer.get_bus_peak_volume_left_db(record_bus_index,0),-72,6,0,78)
	var linear_sample = remap(sample,0,72,0,100)
	
	
	samples.push_front(linear_sample)
	if samples.size() > 20:
		samples.pop_back()
	
	%volume_bar.value = average_sample_strength()
	var db = round(linear_to_db(average_sample_strength())) if round(linear_to_db(average_sample_strength())) > 0 else 0
	%volume_text.text = str("%sdb" % db )
	#%volume_bar.max_value = %volume_slider.value
	#print(sample)


func average_sample_strength() -> float:
	var avg = 0.0
	for i in range (samples.size()):
		avg += samples[i]
	avg /= samples.size()
	return avg


# changing the slider for the volume
func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(mute_bus_index, linear_to_db(value))
	%volume_slider_text.text = str(value*10).pad_zeros(2)
