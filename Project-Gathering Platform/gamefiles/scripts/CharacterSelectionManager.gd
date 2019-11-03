extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var isPlayerCollidingWithCharSlot_one = false
var isPlayerCollidingWithCharSlot_two = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body, extra_arg_0):
	
	# TODO Check if the body is the player, else pass
	if !(get_parent().get_node("Player") == body):
		return
	
	print("Colliding with: ", extra_arg_0)
	
	if extra_arg_0 == 1:
		isPlayerCollidingWithCharSlot_one = true
		
	if extra_arg_0 == 2:
		isPlayerCollidingWithCharSlot_two = true


func _on_Area2D_body_exited(body, extra_arg_0):
	
	# TODO Check if the body is the player, else pass
	if !(get_parent().get_node("Player") == body):
		return
	
	print("Colliding: exited: ", extra_arg_0)
	
	if extra_arg_0 == 1:
		isPlayerCollidingWithCharSlot_one = false
		
	if extra_arg_0 == 2:
		isPlayerCollidingWithCharSlot_two = false
