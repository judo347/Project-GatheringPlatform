extends Node

var is_player_touching_converter = false
var is_player_touching_charModder = false
var is_palyer_touching_uniqueAbilities = false

func show_ui_player_is_touching():
	if is_player_touching_charModder:
		get_parent().get_node("UImaster").show_CharModder()
	elif is_player_touching_converter:
		get_parent().get_node("UImaster").show_MaterialConverter()
	elif is_palyer_touching_uniqueAbilities:
		get_parent().get_node("UImaster").show_UniqueAbilities()