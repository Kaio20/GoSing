extends Control

func _ready() -> void:
	#setting the VideoPlayer Variables in the children for cross scene communication
	%VideoSettings.VideoPlayer = %VideoStreamPlayer
	%VideoSettings.VideoPlayerLabel = %StreamNameLabel
	
	%SearchAndDownload.VideoPlayer = %VideoStreamPlayer

	if not YtDlp.is_setup():
		YtDlp.setup()
		await YtDlp.setup_completed
		$"AspectRatioContainer/Foreground/HBoxContainer/VBoxContainer2/PanelContainer/Top HBar/Filler MarginContainer4/Test YP Setup".visible = false
		#DEBUG

# TO DO
#loading animation beim convertieren
#Bug fixen
# mehr Spieler einfügen
# Beispiel sein für Godot für mehr INput und auch für andere Videoformate
# Trotzdem veröffentlichen
#Handy  Tastatur probieren
#Game Pad Support hinzufügen
#Echtes Starter Screen

