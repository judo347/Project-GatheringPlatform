extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	get_node("MaterialConverter").material_converter_tick()
	close_ui_key_checker()

func close_ui_key_checker():
	if Input.is_action_just_pressed("ui_cancel"):
		close_all_window_ui()
	elif Input.is_action_just_pressed("ui_left"):
		close_all_window_ui()
	elif Input.is_action_just_pressed("ui_up"):
		close_all_window_ui()
	elif Input.is_action_just_pressed("ui_down"):
		close_all_window_ui()

func close_all_window_ui():
	hide_MaterialConverter()

func show_MaterialConverter():
	get_node("MaterialConverter").show()
	
func hide_MaterialConverter():
	get_node("MaterialConverter").hide()