extends Node

onready var player = get_parent().get_node("Player")

onready var jump = get_node("Jump")
onready var slide = get_node("Slide")
onready var death = get_node("Death")
onready var pickup = get_node("Pickup")
onready var music_theme1 = get_node("Theme1")
onready var music_theme2 = get_node("Theme2")
onready var music_theme3 = get_node("Theme3")

var isInLevel = false
var isThemePlaying = false
var currentTheme

func _process(delta):
	
	if playerData.shouldPlayDeathSound:
		death()
		playerData.shouldPlayDeathSound = false
	
	#Follow the player
	#self.transform.set_position(player.get_position())
	get_parent().get_node("MusicManager").set_position(player.get_position())
	
	if isInLevel:
		if !isThemePlaying:
			match playerData.currentCharacter:
				enums.CharacterEnum.ONE: music_theme1()
				enums.CharacterEnum.TWO: music_theme2()
				enums.CharacterEnum.THREE: music_theme3()
			isThemePlaying = true
		else:
			isThemeDonePlaying()

func _ready():
	if get_parent().name == "Level":
		isInLevel = true
	else:
		isInLevel = false

# This is the looping mechanic
func isThemeDonePlaying():
	if isThemePlaying:
		if currentTheme == 1:
			if !music_theme1.playing:
				music_theme1()
		elif currentTheme == 2:
			if !music_theme2.playing:
				music_theme2()
		elif currentTheme == 3:
			if !music_theme3.playing:
				music_theme3()

func jump():
	jump.play(0)

func slide():
	slide.play(0)

func death():
	death.play(0)

func music_theme1():
	music_theme1.play(0)
	currentTheme = 1

func music_theme2():
	music_theme2.play(0)
	currentTheme = 2

func music_theme3():
	music_theme3.play(0)
	currentTheme = 3

func pickup():
	pickup.play(0)