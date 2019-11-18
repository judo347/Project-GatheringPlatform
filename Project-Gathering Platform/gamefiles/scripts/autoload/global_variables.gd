extends Node

const material_default_yield = 5

var player_character_texture_one = load("res://resources/01/Character001.png")
var player_character_texture_two = load("res://resources/01/Character002.png")
var player_character_texture_three = load("res://resources/01/Character003.png")

var material_one_grass_texture = load("res://resources/01/Material001.png")
var material_two_stone_texture = load("res://resources/01/Material002.png")
var material_three_wood_texture = load("res://resources/01/Material003.png")

var bench_charModder_background_selected = load("res://resources/01/CharMod_Selected001.png")
var bench_charModder_background_deselected = load("res://resources/01/CharMod_Deselected001.png")

var achievement_gameobject = load("res://gamefiles/scenes/game_objects/Achievement.tscn")

# The % of materials lost on death in a level
var death_penalty_percent = 80