extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	for achiv in achievements.achievementsArray:
		add_achievement_to_ui(achiv.text, achiv.isCompleted)

func refresh_achievements():
	remove_all_achievements_ui()
	achievements.refresh_achievements()
	for achiv in achievements.achievementsArray:
		add_achievement_to_ui(achiv.text, achiv.isCompleted)

func add_achievement_to_ui(label_text, isCompleted):
	var achievement_scene = global_variables.achievement_gameobject
	var achievement_scene_instanced = achievement_scene.instance()
	achievement_scene_instanced.get_node("Label").text = label_text
	
	if isCompleted:
		achievement_scene_instanced.get_node("TextureRect").texture = global_variables.bench_charModder_background_selected
	else:
		achievement_scene_instanced.get_node("TextureRect").texture = global_variables.bench_charModder_background_deselected
	
	get_node("ScrollContainer/VBoxContainer").add_child(achievement_scene_instanced)

func remove_all_achievements_ui():
	for child in get_node("ScrollContainer/VBoxContainer").get_children():
		child.queue_free()