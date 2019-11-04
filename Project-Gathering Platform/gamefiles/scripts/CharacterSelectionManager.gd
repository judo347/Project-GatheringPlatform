extends Node2D

var isPlayerCollidingWithCharSlot_one = false
var isPlayerCollidingWithCharSlot_two = false
var isPlayerCollidingWithCharSlot_three = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body, extra_arg_0):
	
	# TODO Check if the body is the player, else pass
	if !(get_parent().get_node("Player") == body):
		return
	
	print("Colliding with: ", extra_arg_0)
	
	if extra_arg_0 == 1:
		isPlayerCollidingWithCharSlot_one = true
		
	if extra_arg_0 == 2:
		isPlayerCollidingWithCharSlot_two = true
		
	if extra_arg_0 == 3:
		isPlayerCollidingWithCharSlot_three = true

func _on_Area2D_body_exited(body, extra_arg_0):
	
	# TODO Check if the body is the player, else pass
	if !(get_parent().get_node("Player") == body):
		return
	
	print("Colliding: exited: ", extra_arg_0)
	
	if extra_arg_0 == 1:
		isPlayerCollidingWithCharSlot_one = false
		
	if extra_arg_0 == 2:
		isPlayerCollidingWithCharSlot_two = false
		
	if extra_arg_0 == 3:
		isPlayerCollidingWithCharSlot_two = false
