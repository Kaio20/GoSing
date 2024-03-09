extends Control

func _ready() -> void:
	#setting the VideoPlayer Variables in the children for cross scene communication
	%VideoSettings.VideoPlayer = %VideoStreamPlayer
	%VideoSettings.VideoPlayerLabel = %StreamNameLabel
	
	%SearchAndDownload.VideoPlayer = %VideoStreamPlayer

	if not YtDlp.is_setup():
		YtDlp.setup()
		await YtDlp.setup_completed
		print("setup_complete")
