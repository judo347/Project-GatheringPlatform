extends Node

# Returns a random value between the two given parameters (including both)
# params; val_min: int; val_max: int;
func get_rand(val_min, val_max):
	
	return (randi()%(val_max-val_min+1))+val_min
	# return (randi()%(val_max+1))+val_min

func character_enum_to_int(type):
	match type:
		enums.CharacterEnum.ONE: return 1
		enums.CharacterEnum.TWO: return 2
		enums.CharacterEnum.THREE: return 3

func get_rand_material_enum():
	var number = get_rand(1,3)
	
	match number:
		1: return enums.MaterialEnum.GRASS
		2: return enums.MaterialEnum.STONE
		3: return enums.MaterialEnum.WOOD