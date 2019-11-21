extends Node

onready var map = get_node("TileMap")
onready var materials_parent = get_node("Materials")

var hasPopulated = false

# Called when the node enters the scene tree for the first time.
func _ready():
	populate_scene()

func populate_scene():
	
	# Generate tiles
	var tiles_generated = TilePlacementGenerator.generate_tiles()
	
	# Generate materials
	var materials_generated = TilePlacementGenerator.generate_materials(tiles_generated)
	
	# Place tiles
	for tile in tiles_generated:
		place_tile(tile)
		
	# Place materials
	for material in materials_generated:
		place_material(material, utilities.get_rand_material_enum())

	# place_material(Vector2(200, 0), enums.MaterialEnum.GRASS)
	# place_material_with_amount(Vector2(200, -100), enums.MaterialEnum.STONE, 10)
	# place_material(Vector2(200, 100), enums.MaterialEnum.WOOD)

# Places a tile on the given position
# params: pos: Vector2(x,y)
func place_tile(pos):
	map.set_cellv(pos, 0)

# Instantiates and places a material on the given location
# params; pos: Vector2(x,y); type: MaterialEnum;
func place_material(pos, type):
	place_material_with_amount(pos, type, 5)

# params; pos: Vector2(x,y); type: MaterialEnum; amount: int
func place_material_with_amount(pos, type, amount):
	
	#print("x: ", pos.x, " y: ", pos.y)
	
	# Instantiate
	var material_scene = load("res://gamefiles/scenes/game_objects/Material.tscn")
	var material_scene_instanced = material_scene.instance()
	
	# Modify based on type
	material_scene_instanced.set_material_type(type) # TODO generate somehow
	material_scene_instanced.set_material_yeild(amount)
	
	# Calculate position
	var sprite_size_vector = material_scene_instanced.get_node("Sprite").get_rect().size
	var world_pos = map.map_to_world(pos)
	var spawn_position = Vector2(world_pos.x + (sprite_size_vector.x /2), world_pos.y + (sprite_size_vector.y /2))
	
	# Set postition
	material_scene_instanced.global_translate(spawn_position)
	
	# Add to level
	materials_parent.add_child(material_scene_instanced)

class TilePlacementGenerator extends Node:
	
	const LEVEL_MAX_HEIGHT = 10
	const LEVEL_MAX_LENGTH = 100
	
	const LEVEL_MAX_TILE_DISTANCE_HEIGHT = 5
	const LEVEL_MAX_TILE_DISTANCE_LEGTH = 3
	
	const LEVEL_MAX_PLATFORM_LENGTH = 6
	
	static func generate_tiles():
		
		var tile_list = Array()
		var currentX = 0
		var currentY = 0
		var lastY = 0
		var isFirstRunThrough = true

		############
		while currentX < LEVEL_MAX_LENGTH:
			
			# Find starting Y for platform
			if !isFirstRunThrough:
				lastY = currentY
			
			currentY = utilities.get_rand(0, LEVEL_MAX_HEIGHT)
			#print("y dif: ", abs(currentY - lastY))
			
			# TODO Check this y compared to the old Y, less or equal to allowed distacne?
			if !isFirstRunThrough:
				while abs(currentY - lastY) >= LEVEL_MAX_TILE_DISTANCE_HEIGHT + 1:
					#print("Heigh dif: ", abs(currentY - lastY)) # TODO DEBUG
					currentY = utilities.get_rand(0, LEVEL_MAX_HEIGHT)
			#print("Selected height dif: ", abs(currentY - lastY)) # TODO DEBUG
			
			# Find the length of the platform
			var platform_length = utilities.get_rand(1, LEVEL_MAX_PLATFORM_LENGTH)
			
			# Generate tiles and add to array
			for i in range(0, platform_length):
				tile_list.append(Vector2(currentX, currentY))
				currentX += 1
			
			# Should the level end early check. Let the chance grow the closer to the limit we get.
			# TODO
			
			if isFirstRunThrough:
				isFirstRunThrough = false
		
		return tile_list

	static func generate_materials(tile_array):
		
		var material_list = Array()
		
		for tile in tile_array:
			if utilities.get_rand(0,1) == 1:
				#print("x: ", tile.x, " y: ", tile.y)
				material_list.append(Vector2(tile.x, tile.y -1))
		
		return material_list