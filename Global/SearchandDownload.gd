extends VBoxContainer

var VideoPlayer: VideoStreamPlayer

func _ready() -> void:
	pass
	
func yt_download (download_link):
	var str_length = str(download_link).length()
	var str_equal_pos = str(download_link).find("=",0)
	var new_yt_str = str(download_link).right(str_length-str_equal_pos-1)
	#get the download link in the short youtube format
	var download_short_link = str("https://youtu.be/%s" % new_yt_str)
	var short_file ="user://video/"+ new_yt_str +".ogv"
	print("user://video/"+ new_yt_str)
	
	if FileAccess.file_exists(short_file):
		print("here it is")
	else:
		var download := YtDlp.download(download_short_link) \
		.set_destination("user://video/") \
		.set_file_name(new_yt_str) \
		.convert_to_video(YtDlp.Video.OGV) \
		.start()

		await download.download_completed


	var stream = VideoStreamTheora.new()
	stream.file = short_file

	VideoPlayer.stream = stream
	VideoPlayer.play()

func _on_download_button_pressed() -> void:
	yt_download(%SearchTextEdit.text )
	
	pass # Replace with function body.
