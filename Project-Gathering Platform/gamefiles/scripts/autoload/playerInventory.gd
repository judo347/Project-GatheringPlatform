extends Node

var material_grass_count = 0
var material_wood_count = 0
var material_stone_count = 0

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
	
func debug_print():
	print("Player inventory report:")
	print("Grass amount: ", material_grass_count)
	print("Wood amount: ", material_wood_count)
	print("Stone amount: ", material_stone_count)