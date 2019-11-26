extends Node

var currentCharacter = enums.CharacterEnum.ONE
var texture = load("res://resources/01/Character001.png")
var shouldPlayDeathSound = false

var isInHomebase = false
var isInLevel = false

# Should be incremented each time a level is completed.
var levels_completed = 0

# Char modding abilities
var hasDoubleJump = false
var hasSlide = false

# Unique abilities
var is_noDeathPenalty_enabled = false
var is_worldFlip_enabled = false

# Level Modder
## Level
var levelMod_level_dangerPoints = 0
var levelMod_level_materialYield = 0
## Player
var levelMod_player_movementspeedPoints = 0