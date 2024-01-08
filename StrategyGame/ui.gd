extends Control

@onready var building_buttons : Node = get_node("BuildingButtons")
@onready var food_metal_text : Label = get_node("FoodMetalTextLabel")
@onready var oxygen_energy_text : Label = get_node("OxygenEnergyTextLabel")
@onready var cur_turn_text : Label = get_node("TurnLabel")

@onready var game_manager : Node = get_node("/root/MainScene")

func end_turn():
	
	cur_turn_text.text = "Turn: " + str(game_manager.cur_turn)
	building_buttons.visible = true

func update_resource_text():
	
	var food_metal  = ""
	
	food_metal += str(game_manager.cur_food) + " (" + ("+" if game_manager.food_per_turn >= 0 else "") +  str(game_manager.food_per_turn) + ")\n"
	food_metal += str(game_manager.cur_metal) + " (" + ("+" if game_manager.metal_per_turn >= 0 else "") +  str(game_manager.metal_per_turn) + ")"
	
	food_metal_text.text = food_metal
	
	var oxygen_energy = ""
	
	oxygen_energy += str(game_manager.cur_oxygen) + " (" + ("+" if game_manager.oxygen_per_turn >= 0 else "") +  str(game_manager.oxygen_per_turn) + ")\n"
	oxygen_energy += str(game_manager.cur_energy) + " (" + ("+" if game_manager.energy_per_turn >= 0 else "") +  str(game_manager.energy_per_turn) + ")"
	
	oxygen_energy_text.text = oxygen_energy

func _on_end_turn_button_pressed():
	game_manager.end_turn()

func _on_mine_button_pressed():
	building_buttons.visible = false
	game_manager.on_select_building(1)

func _on_green_house_button_pressed():
	building_buttons.visible = false
	game_manager.on_select_building(2)

func _on_solar_panel_button_pressed():
	building_buttons.visible = false
	game_manager.on_select_building(3)
