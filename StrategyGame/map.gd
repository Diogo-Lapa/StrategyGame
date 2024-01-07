extends Node

var all_tiles : Array
var tiles_with_buildings : Array
var tile_size : float = 64.0

func _ready():
	
	#when we are initialized, get all of the tiles
	all_tiles = get_tree().get_nodes_in_group("Tiles")
	
	#find the start tile to place the Base Building
	for x in range(all_tiles.size()):
		if all_tiles[x].start_tile == true:
			place_building(all_tiles[x], BuildingData.base.icon_texture)

func get_tile_at_position(position):
	
	for x in range (all_tiles.size()):
		if all_tiles[x].position == position and all_tiles[x].has_building == false:
			return all_tiles[x]
			
	return null

func disable_tile_highlights():
	
	for x in range (all_tiles.size()):
		all_tiles[x].toggle_highlight(false)

func highlight_available_tiles():
	
	for x in range(tiles_with_buildings.size()):
		
		var north_tile = get_tile_at_position(tiles_with_buildings[x].position + Vector2(0, tile_size))
		var south_tile = get_tile_at_position(tiles_with_buildings[x].position + Vector2(0, -tile_size))
		var west_tile = get_tile_at_position(tiles_with_buildings[x].position + Vector2(-tile_size, 0))
		var east_tile = get_tile_at_position(tiles_with_buildings[x].position + Vector2(tile_size, 0))
		
		if north_tile != null:
			north_tile.toggle_highlight(true)
		if south_tile != null:
			south_tile.toggle_highlight(true)
		if east_tile != null:
			east_tile.toggle_highlight(true)
		if west_tile != null:
			west_tile.toggle_highlight(true)
			

#places down a building on the map
func place_building(tile, texture):
	
	tiles_with_buildings.append(tile)
	tile.place_building(texture)
	
	disable_tile_highlights()
