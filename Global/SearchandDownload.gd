extends VBoxContainer

var VideoPlayer: VideoStreamPlayer

func _ready() -> void:
	pass
	
func yt_download (download_link):
	var str_length = str(download_link).length()
	var str_equal_pos = str(download_link).find("=",0)
	var new_yt_str = str(download_link).right(str_length-str_equal_pos-1)
	#get the download link in the short youtube format
	print(str("https://youtu.be/%s" % new_yt_str))
	
	
	var download := YtDlp.download("https://youtu.be/FAyKDaXEAgc") \
		.set_destination("user://video/") \
		.set_file_name("ok_computer") \
		.convert_to_video(YtDlp.Video.OGV) \
		.start()

	await download.download_completed

	var stream = VideoStreamTheora.new()
	stream.file = "user://video/ok_computer.ogv"

	VideoPlayer.stream = stream
	VideoPlayer.play()

func _on_download_button_pressed() -> void:
	yt_download(%SearchTextEdit.text )
	
	pass # Replace with function body.
