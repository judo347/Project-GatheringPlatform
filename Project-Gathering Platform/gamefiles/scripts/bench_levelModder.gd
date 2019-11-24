extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var wasPlayerBodyFound = false
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			wasPlayerBodyFound = true
			
	if wasPlayerBodyFound:
		get_parent().is_palyer_touching_levelModder = true
	else:
		get_parent().is_palyer_touching_levelModder = false