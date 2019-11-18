extends Node

var currentCharacter = enums.CharacterEnum.ONE
var texture = load("res://resources/01/Character001.png")

# Char modding abilities
var hasDoubleJump = false
var hasSlide = false

# Unique abilities
var is_noDeathPenalty_enabled = false
var is_worldFlip_enabled = false