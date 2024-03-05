extends OptionButton
var devices: Array = []
@export var last_used_device_index = 2 #aktuell mein Debug später soll er das speichern können

func _ready() -> void:
	devices = AudioServer.get_input_device_list()

	_on_item_selected(last_used_device_index)
	
	for i in range(devices.size()):
		var device = devices[i]
		add_item(device)
		
		if device == AudioServer.get_input_device():
			select(i)
			


func _on_item_selected(index: int) -> void:
	AudioServer.set_input_device(devices[index])
	pass # Replace with function body.

