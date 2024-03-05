extends Control
@onready var volume_bar = %volume_bar
@onready var volume_text = %volume_text

var record_bus_index: int
var samples = []

func _ready() -> void:
	record_bus_index = AudioServer.get_bus_index("Record")
	
func _process(delta: float) -> void:
	var sample = remap(AudioServer.get_bus_peak_volume_left_db(record_bus_index,0),-72,6,0,78)
	var linear_sample = remap(sample,0,72,0,100)
	
	
	samples.push_front(linear_sample)
	if samples.size() > 20:
		samples.pop_back()
	
	%volume_bar.value = linear_sample# average_sample_strength()
	var db = round(linear_to_db(average_sample_strength())) if round(linear_to_db(average_sample_strength())) > 0 else 0
	%volume_text.text = str("%s db" % db )
	print(remap(sample,0,78,0,1))


func average_sample_strength() -> float:
	var avg = 0.0
	for i in range (samples.size()):
		avg += samples[i]
	avg /= samples.size()
	return avg
