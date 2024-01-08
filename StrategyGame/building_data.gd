extends Node

var base = building.new(0, preload("res://Sprites/Base.png"), 0, 0, 0, 0)
var mine = building.new(1, preload("res://Sprites/Mine.png"), 2, 1, 4, -1)
var greenhouse = building.new(2, preload("res://Sprites/Greenhouse.png"), 1, 1, 0, 0)
var solar_panel = building.new(3, preload("res://Sprites/SolarPanel.png"), 4, 1, 0, 0)

class building:
	
	#building type
	var type : int
	
	#building texture
	var icon_texture : Texture
	
	#resources the building produces
	var prod_resources : int = 0
	var prod_amount : int 
	
	#resources the building needs to mantain
	var upkeep_resources : int = 0
	var upkeep_amount : int
	
	func _init(type, icon_texture, prod_resources, prod_amount, upkeep_resources, upkeep_amount):
		
		self.type = type
		self.icon_texture = icon_texture
		self.prod_resources = prod_resources
		self.prod_amount = prod_amount
		self.upkeep_resources = upkeep_resources
		self.upkeep_amount = upkeep_amount
		
		
