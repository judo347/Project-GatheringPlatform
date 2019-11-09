extends Node

var is_player_touching_converter = false
var is_player_touching_charModder = false

func show_ui_player_is_touching():
	if is_player_touching_charModder:
		get_parent().get_node("UImaster").show_CharModder()
	elif is_player_touching_converter:
		get_parent().get_node("UImaster").show_MaterialConverter()