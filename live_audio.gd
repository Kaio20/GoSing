extends Control
@onready var volume_bar = $volume_bar
@onready var volume_text = $volume_text

var record_bus_index: int
var samples = []

func _ready() -> void:
	record_bus_index = AudioServer.get_bus_index("Record")
	
func _process(delta: float) -> void:
	var sample = remap(AudioServer.get_bus_peak_volume_left_db(record_bus_index,0),-75,10,0,100) #buggy da er ohne remap erst deutlich später anfängt
	var linear_sample = sample #db_to_linear(sample)
	samples.push_front(linear_sample)
	
	if samples.size() > 20:
		samples.pop_back()
	
	volume_bar.value = average_sample_strength()
	volume_text.text = str("%s db" % round(linear_to_db(average_sample_strength())) )
	print(AudioServer.get_bus_peak_volume_left_db(record_bus_index,0))

func average_sample_strength() -> float:
	var avg = 0.0
	for i in range (samples.size()):
		avg += samples[i]
	avg /= samples.size()
	return avg
