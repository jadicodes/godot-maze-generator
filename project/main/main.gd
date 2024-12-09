extends Control


var _original_position: Vector2
var _number_of_grabbables: int = 3
var _grabbables: Array[Node2D]


func _ready() -> void:
	_original_position = $Player.position
	%RefreshButton.hide()


func _on_refresh_button_pressed() -> void:
	%RefreshButton.hide()
	$WideMazeGenerator.make_maze()
	$Player.position = _original_position
	for x in _grabbables:
		x.queue_free()
		_grabbables.erase(x)


func _on_wide_maze_generator_maze_completed() -> void:
	%RefreshButton.show()
	_spawn_grabbables()


func _spawn_grabbables():
	var empty_tiles: Array[Vector2] = $WideMazeGenerator.get_empty_tiles()

	for x in _number_of_grabbables:
		var current: Vector2 = empty_tiles.pick_random()
		empty_tiles.erase(current)
		var _grabbable = preload("res://grabbables/grabbable.tscn").instantiate()
		call_deferred("add_child", _grabbable)

		_grabbable.global_position = Vector2(current.x * 16, current.y * 16)
		_grabbables.append(_grabbable)
