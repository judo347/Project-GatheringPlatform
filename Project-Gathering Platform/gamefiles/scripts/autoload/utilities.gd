extends Node

# Returns a random value between the two given parameters (including both)
# params; val_min: int; val_max: int;
func get_rand(val_min, val_max):
	
	return (randi()%(val_max-val_min+1))+val_min
	# return (randi()%(val_max+1))+val_min