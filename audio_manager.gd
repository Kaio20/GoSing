extends Node

#@onready var volume_bar = $VSlider
#@onready var volume_value = $VSlider.value
#
#var record_bus_index: int
#
#func _ready() -> void:
	#record_bus_index = AudioServer.get_bus_index("Record")
	#
#func _process(delta: float) -> void:
	#var sample = AudioServer.get_bus_peak_volume_left_db(record_bus_index,0)
	#var linear_sample = db_to_linear(sample)
	#
	#volume_bar.value = linear_sample
