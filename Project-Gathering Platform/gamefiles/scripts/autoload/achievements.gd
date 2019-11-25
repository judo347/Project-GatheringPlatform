extends Node

var achievement_class = load("res://gamefiles/scripts/classes/Achievement.gd")
var achievementsArray = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	initialize_achievements()

func initialize_achievements():
	initialize_achievement(0, "Complete a level", achiv_one())
	initialize_achievement(1, "Unlock double jump", achiv_two())
	initialize_achievement(2, "This is test achiv 3", achiv_three())

func refresh_achievements():
	achievementsArray.clear()
	initialize_achievements()

func initialize_achievement(id, text, isCompleted):
	var achiv = achievement_class.new()
	achiv.contruct(id, text, isCompleted)
	achievementsArray.append(achiv)

func achiv_one():
	if playerData.levels_completed > 0:
		return true
	else:
		return false

func achiv_two():
	return playerData.hasDoubleJump

func achiv_three():
	return false