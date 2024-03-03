extends OptionButton
var devices: Array = []


func _ready() -> void:
	devices = AudioServer.get_input_device_list()
	
	for i in range(devices.size()):
		var device = devices[i]
		add_item(device)
		
		if device == AudioServer.get_input_device():
			select(i)
			

	#connect(item_selected,self,_on_item_selected())
	


func _on_item_selected(index: int) -> void:
	AudioServer.set_input_device(devices[index])
	pass # Replace with function body.


func _on_item_focused(index: int) -> void:
	pass # Replace with function body.
