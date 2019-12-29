extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_MusicManager():
	return get_tree().get_current_scene().get_node("MusicManager")

func isCurrentScene_Level():
	return get_tree().get_current_scene().get_name() == "Level"

func isCurrentScene_Homebase():
	return get_tree().get_current_scene().get_name() == "World"