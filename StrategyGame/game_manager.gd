extends Node2D

var cur_food : int = 0
var cur_metal : int = 0
var cur_oxygen : int = 0
var cur_energy : int = 0

var food_per_turn : int = 0
var metal_per_turn : int = 0
var oxygen_per_turn : int = 0
var energy_per_turn : int = 0

var cur_turn : int = 1
var placing_building : bool = false
var building_to_place : int

#components
@onready var ui : Node = get_node("UI")
@onready var map : Node = get_node("Tiles") 

func _ready():
	ui.update_resource_text()
	ui.end_turn()

func on_select_building(building_type):
	
	placing_building = true
	building_to_place = building_type
	
	map.highlight_available_tiles()
	
func add_to_resource_per_turn(resource, amount):
	
	if resource == 0:
		return
	elif resource == 1:
		food_per_turn += amount
	elif resource == 2:
		metal_per_turn += amount
	elif resource == 3:
		oxygen_per_turn += amount
	elif resource == 4:
		energy_per_turn += amount

func place_building(tile_to_place_on):
	
	placing_building = false
	var texture : Texture
	
	#are we placing a mine?
	if building_to_place == 1:
		texture = BuildingData.mine.icon_texture
		
		add_to_resource_per_turn(BuildingData.mine.prod_resources, BuildingData.mine.prod_amount)
		add_to_resource_per_turn(BuildingData.mine.upkeep_resources, BuildingData.mine.upkeep_amount)
		
	#are we placing a greenhouse?
	if building_to_place == 2:
		texture = BuildingData.greenhouse.icon_texture
		
		add_to_resource_per_turn(BuildingData.greenhouse.prod_resources, BuildingData.greenhouse.prod_amount)
		add_to_resource_per_turn(BuildingData.greenhouse.upkeep_resources, BuildingData.greenhouse.upkeep_amount)
		
	#are we palcing a solar panel?
	if building_to_place == 3:
		texture = BuildingData.solar_panel.icon_texture
		
		add_to_resource_per_turn(BuildingData.solar_panel.prod_resources, BuildingData.solar_panel.prod_amount)
		add_to_resource_per_turn(BuildingData.solar_panel.upkeep_resources, BuildingData.solar_panel.upkeep_amount)
		
	map.place_building(tile_to_place_on, texture)
	ui.update_resource_text()

func end_turn():
	
	cur_food += food_per_turn
	cur_metal += metal_per_turn
	cur_oxygen += oxygen_per_turn
	cur_energy += energy_per_turn
	
	cur_turn += 1
	
	ui.update_resource_text()
	ui.end_turn()
