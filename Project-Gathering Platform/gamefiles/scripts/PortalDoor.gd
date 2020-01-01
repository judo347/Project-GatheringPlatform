extends Node2D 

onready var animSprite = $AnimatedSprite

var playerAtDoor = false

func _process(delta):
	
	
	pass


func _on_Area2D_body_entered(body):
	
	# TODO Check if the body is the player, else pass
	if !(get_parent().get_node("Player") == body):
		return
	
	playerAtDoor = true
	animSprite.play("1-Opening")

func _on_Area2D_body_exited(body):
	
	# TODO Check if the body is the player, else pass
	if !(get_parent().get_node("Player") == body):
		return
	
	playerAtDoor = false
	animSprite.play("3-Closing")