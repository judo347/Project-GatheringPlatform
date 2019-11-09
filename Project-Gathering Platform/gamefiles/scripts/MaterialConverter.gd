extends Panel

var mouseIsOver_stone = false
var mouseIsOver_wood = false
var mouseIsOver_grass = false

func material_converter_tick():
	if Input.is_action_just_pressed("ui_mouse_left"):
		if mouseIsOver_stone:
			if playerInventory.material_stone_count >= 3:
				playerInventory.material_stone_count -= 3
				playerInventory.skillpoints += 1
		elif mouseIsOver_wood:
			if playerInventory.material_wood_count >= 3:
				playerInventory.material_wood_count -= 3
				playerInventory.skillpoints += 1
		elif mouseIsOver_grass:
			if playerInventory.material_grass_count >= 3:
				playerInventory.material_grass_count -= 3
				playerInventory.skillpoints += 1
		
		# Update UI
		get_parent().get_node("PermanentUI").update_labels()

func mouse_entered_material_arrow(arrow_number):
	print("Triigered: ", arrow_number)
	
	match arrow_number:
		0: mouseIsOver_stone = true
		1: mouseIsOver_wood = true
		2: mouseIsOver_grass = true

func mouse_exit_material_arrow(arrow_number):
	print("Triigered: ", arrow_number)
	
	match arrow_number:
		0: mouseIsOver_stone = false
		1: mouseIsOver_wood = false
		2: mouseIsOver_grass = false

func convert_material_to_skillpoint(type):
	pass