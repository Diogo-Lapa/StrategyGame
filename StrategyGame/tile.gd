extends Area2D

@export var start_tile : bool = false

var has_building : bool = false
var can_place_building : bool = false

#components
@onready var highlight : Sprite2D = get_node("Highlight")
@onready var building_icon : Sprite2D = get_node("BuildingIcon")

func _ready():
	add_to_group("Tiles")
	
func toggle_highlight(toggle):
	highlight.visible = toggle
	can_place_building = toggle
	
func place_building(building_texture):
	has_building = true
	building_icon.texture = building_texture

func _on_input_event(viewport, event, shape_idx):
	
	if event is InputEventMouseButton and event.pressed:
		var game_manager = get_node("/root/MainScene") 
		
		if game_manager.placing_building and game_manager.building_to_place:
			game_manager.place_building(self)
