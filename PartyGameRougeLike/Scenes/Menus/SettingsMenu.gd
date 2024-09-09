extends Control

@onready var resolution_button = $"VBoxContainer/Resolution Split/ResOptionButton"

var resolutions: Dictionary = {"3840x2160":Vector2i(3840,2160),
								"2560x1440":Vector2i(2560,1440),
								"1920x1080":Vector2i(1920,1080),
								"1280x720":Vector2i(1280,720)}
								
@onready var FullScreenBox: CheckBox = $"VBoxContainer/FullScreen Split/FScrCheckBox"

@onready var vBox = $VBoxContainer/VSyncSplit/VsCheckBox
@onready var loadedLevel = load("res://Scenes/Menus/MainMenu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	AddRes()
	CheckVariables()
	pass # Replace with function body.

func CheckVariables():
	var window = get_window()
	var mode = window.get_mode()
	
	if mode == Window.MODE_FULLSCREEN:
		FullScreenBox.set_pressed_no_signal(true)
		
	if DisplayServer.window_get_vsync_mode() == DisplayServer.VSYNC_ENABLED:
		vBox.set_pressed_no_signal(true)

func SetResText():
	var resTxt = str(get_window().get_size().x) + "x" + str(get_window().get_size().y)
	resolution_button.set_text(resTxt)

func AddRes():
	var curRes = get_window().get_size()
	var ID = 0
	for r in resolutions:
		resolution_button.add_item(r, ID)
		
		if resolutions[r] == curRes:
			resolution_button.select(ID)
		ID += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_res_option_button_item_selected(index):
	var UiPlayuer = get_parent().get_node("UISFX")
	UiPlayuer.play()
	var ID = resolution_button.get_item_text(index)
	get_window().set_size(resolutions[ID])
	pass # Replace with function body.



func _on_f_scr_check_box_toggled(toggled_on):
	var UiPlayuer = get_parent().get_node("UISFX")
	UiPlayuer.play()
	if toggled_on:
		get_window().set_mode(Window.MODE_FULLSCREEN)
		SetResText()
	else:
		get_window().set_mode(Window.MODE_WINDOWED)
	pass # Replace with function body.

func _on_vs_check_box_toggled(toggled_on):
	var UiPlayuer = get_parent().get_node("UISFX")
	UiPlayuer.play()
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	pass # Replace with function body.


func _on_button_pressed():
	var UiPlayuer = get_parent().get_node("UISFX")
	UiPlayuer.play()
	var scene_instance = loadedLevel.instantiate()
	get_parent().add_child(scene_instance)
	queue_free()
	pass # Replace with function body.
