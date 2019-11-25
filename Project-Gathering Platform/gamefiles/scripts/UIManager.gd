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
	get_node("CharModder").charModder_converter_tick() #TODO rename method (-converter)
	get_node("UniqueAbilities").uniqueAbilities_tick()
	get_node("LevelModder").levelModder_tick()
	close_ui_key_checker()

func close_ui_key_checker():
	
	if Input.is_action_just_pressed("ui_cancel"):
		close_all_window_ui()
	elif Input.is_action_just_pressed("ui_left"):
		close_all_window_ui()
	elif Input.is_action_just_pressed("ui_right"):
		close_all_window_ui()
	elif Input.is_action_just_pressed("ui_up"):
		close_all_window_ui()
	elif Input.is_action_just_pressed("ui_down"):
		close_all_window_ui()

func close_all_window_ui():
	hide_MaterialConverter()
	hide_CharModder()
	hide_AchievementMenu()
	hide_UniqueAbilities()
	hide_LevelModder()

func show_MaterialConverter():
	get_node("MaterialConverter").show()
	
func hide_MaterialConverter():
	get_node("MaterialConverter").hide()

func show_CharModder():
	get_node("CharModder").show()
	
func hide_CharModder():
	get_node("CharModder").hide()
	
func show_UniqueAbilities():
	get_node("UniqueAbilities").show()
	
func hide_UniqueAbilities():
	get_node("UniqueAbilities").hide()
	
func show_AchievementMenu():
	get_node("UIFullscreens/AchievementMenu").refresh_achievements()
	get_node("UIFullscreens/AchievementMenu").show()
	
func hide_AchievementMenu():
	get_node("UIFullscreens/AchievementMenu").hide()

func show_LevelModder():
	get_node("LevelModder").show()
	
func hide_LevelModder():
	get_node("LevelModder").hide()