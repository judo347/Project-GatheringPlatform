extends Node

var material_grass_count = 0
var material_wood_count = 0
var material_stone_count = 0

var material_grass_count_level_collected = 0
var material_wood_count_level_collected = 0
var material_stone_count_level_collected = 0

var skillpoints = 12 #TODO DEBUG: default = 0

func add_skillpoint():
	skillpoints += 1

func add_skillpoints(amount):
	skillpoints = skillpoints + amount
	
func remove_skillpoint():
	skillpoints -= 1

func remove_skillpoints(amount):
	skillpoints = skillpoints - amount

# params: enums.Material, the amount to add
func add_material(type, amount):
	match type:
		enums.MaterialEnum.GRASS:
			material_grass_count += amount
		enums.MaterialEnum.STONE:
			material_stone_count += amount
		enums.MaterialEnum.WOOD:
			material_wood_count += amount
	
	debug_print() # TODO temp debugging

func add_collected_material(type, amount):
	match type:
		enums.MaterialEnum.GRASS:
			material_grass_count_level_collected += amount
		enums.MaterialEnum.STONE:
			material_stone_count_level_collected += amount
		enums.MaterialEnum.WOOD:
			material_wood_count_level_collected += amount

# Called on transfer from level to homebase
func collect_materials(isLevelCompleted):
	if isLevelCompleted || playerData.is_noDeathPenalty_enabled:
		material_grass_count += material_grass_count_level_collected
		material_stone_count += material_stone_count_level_collected
		material_wood_count += material_wood_count_level_collected
		
	else:
		var keep_percent = ((100 - float(global_variables.death_penalty_percent)) / 100)
		material_grass_count += floor(material_grass_count_level_collected * keep_percent)
		material_stone_count += floor(material_stone_count_level_collected * keep_percent)
		material_wood_count += floor(material_wood_count_level_collected * keep_percent)
	
	reset_collected_materials()

func reset_collected_materials():
	material_grass_count_level_collected = 0
	material_wood_count_level_collected = 0
	material_stone_count_level_collected = 0

func debug_print():
	print("Player inventory report:")
	print("Grass amount: ", material_grass_count)
	print("Wood amount: ", material_wood_count)
	print("Stone amount: ", material_stone_count)
	print("Player collected  report:")
	print("Grass amount: ", material_grass_count_level_collected)
	print("Wood amount: ", material_wood_count_level_collected)
	print("Stone amount: ", material_stone_count_level_collected)