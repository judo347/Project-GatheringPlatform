extends Node

onready var map = get_node("TileMap")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	populate_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func populate_scene():
	
	place_material(Vector2(200, 0), enums.MaterialEnum.GRASS)
	place_material_with_amount(Vector2(200, -100), enums.MaterialEnum.STONE, 10)
	place_material(Vector2(200, 100), enums.MaterialEnum.WOOD)
	
	place_tile(Vector2(0,2))
	place_tile(Vector2(1,2))
	place_tile(Vector2(2,2))

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
	# Instantiate
	var material_scene = load("res://gamefiles/scenes/game_objects/Material.tscn")
	var material_scene_instanced = material_scene.instance()
	
	# Modify based on type
	material_scene_instanced.set_material_type(type)
	material_scene_instanced.set_material_yeild(amount)
	
	# Set postition
	material_scene_instanced.global_translate(pos)
	
	# Add to level
	.add_child(material_scene_instanced)