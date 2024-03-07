extends VideoStreamPlayer


func _ready() -> void:
	Global.Videostreamer = self.get_path()
	print(Global.Videostreamer)
#ar Videostreamer: VideoStreamPlayer
