extends Panel



# Called when the node enters the scene tree for the first time.
func _ready():
	add_achievement_to_ui("This ach is the first test ach", false)
	add_achievement_to_ui("This ach is the second test ach", true)
	add_achievement_to_ui("This ach is the third test ach", false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func add_achievement_to_ui(label_text, isCompleted):
	var achievement_scene = global_variables.achievement_gameobject
	var achievement_scene_instanced = achievement_scene.instance()
	achievement_scene_instanced.get_node("Label").text = label_text
	
	if isCompleted:
		achievement_scene_instanced.get_node("TextureRect").texture = global_variables.bench_charModder_background_selected
	else:
		achievement_scene_instanced.get_node("TextureRect").texture = global_variables.bench_charModder_background_deselected
	
	get_node("ScrollContainer/VBoxContainer").add_child(achievement_scene_instanced)