extends AudioStreamPlayer

var bgMusic : Array = ["res://Assets/Sounds/Alien Ballad.wav", "res://Assets/Sounds/Synth ballad 05.wav"]
@onready var musicPlayer : AudioStreamPlayer = $"."
var song
# Called when the node enters the scene tree for the first time.
func _ready():
	song = bgMusic.pick_random()
	musicPlayer.stream = load(song)
	musicPlayer.play()
	pass # Replace with function body.


# Called ev ery frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	musicPlayer.stop()
	song = bgMusic.pick_random()
	musicPlayer.stream = load(song)
	musicPlayer.play()
	pass # Replace with function body.
