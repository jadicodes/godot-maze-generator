extends Node2D

signal maze_completed

const N = 1
const E = 2
const S = 4
const W = 8

var cell_walls = {Vector2(1, 0): E, Vector2(-1, 0): W, Vector2(0, 1): S, Vector2(0, -1): N}

@export var tile_size: int # tile size (in pixels)
@export var map_width: int  # width of map (in tiles)
@export var map_height: int # height of map (in tiles)

@onready var Map: TileMapLayer = $TileMapLayer


func _ready():
	make_maze()


# Returns an array of cell's unvisited neighbors

func check_neighbors(cell: Vector2, unvisited: Array) -> Array[Vector2]:
	var list: Array[Vector2] = []
	for n in cell_walls.keys():
		if cell + n in unvisited:
			list.append(cell + n)
	return list


func make_maze():
	var unvisited: Array = []

	var stack: Array = []

	Map.clear()
	
	# For every spot in the map, append it's coordinates to the unvisited array
	# Set that tile to tile 15
	for x in range(map_width):
		for y in range(map_height):
			unvisited.append(Vector2(x, y))
			Map.set_cell(Vector2(x, y), N|E|S|W, Vector2(0,0))

	# Set start tile and erase start tile from unvisited array
	var current: Vector2 = Vector2(0, 0)

	unvisited.erase(current)

	# This loop runs as long as there are unvisited cells
	while unvisited:
		# Get list of neighboring cells that are unvisited
		var neighbors = check_neighbors(current, unvisited)
		# If there is not zero options, pick a random one
		if neighbors.size() > 0:
			var next = neighbors[randi() % neighbors.size()]
			# Add current tile to stack so that it can be backtracked later
			stack.append(current)
			# Calculate the direction vector from cuurent cell to the next cell
			var dir = next - current
			var current_walls = Map.get_cell_source_id(current) & ~cell_walls[dir]
			var next_walls = Map.get_cell_source_id(next) & ~cell_walls[-dir]
			Map.set_cell(current, current_walls, Vector2(0, 0))
			Map.set_cell(next, next_walls, Vector2(0, 0))
			current = next
			unvisited.erase(current)

			await get_tree().process_frame
			await get_tree().process_frame
		elif stack:
			current = stack.pop_back()
	emit_signal("maze_completed")
