extends BoxContainer

@onready var title: Label = $NinePatchRect/VSplitContainer/Title
@onready var artist: Label = $NinePatchRect/VSplitContainer/Artist
@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"
var Titles := ["Alien Ballad", "Synth Ballad 05", "Your Digital FootPrint", "Unkown (Hideout Theme)", "Shattering the Illustion"]
var Artists := ["Oakie Studios LLC", "One Man Symphony"]
var playlist
func _ready() -> void:
	playlist = audio_stream_player.stream
	if playlist.get_list_stream(0):
		title.text = Titles[0]
		artist.text = Artists[0]
	if playlist.get_list_stream(1):
		title.text = Titles[1]
		artist.text = Artists[0]
	if playlist.get_list_stream(2):
		title.text = Titles[2]
		artist.text = Artists[1]
	if playlist.get_list_stream(3):
		title.text = Titles[3]
		artist.text = Artists[1]
	if playlist.get_list_stream(4):
		title.text = Titles[4]
		artist.text = Artists[1]
		
func _on_audio_stream_player_finished() -> void:
	playlist = audio_stream_player.stream
	if playlist.get_list_stream(0):
		title.text = Titles[0]
		artist.text = Artists[0]
	if playlist.get_list_stream(1):
		title.text = Titles[1]
		artist.text = Artists[0]
	if playlist.get_list_stream(2):
		title.text = Titles[2]
		artist.text = Artists[1]
	if playlist.get_list_stream(3):
		title.text = Titles[3]
		artist.text = Artists[1]
	if playlist.get_list_stream(4):
		title.text = Titles[4]
		artist.text = Artists[1]
	pass # Replace with function body.
