extends Control


var _original_position: Vector2

func _ready() -> void:
	_original_position = $Player.position
	%RefreshButton.hide()


func _on_refresh_button_pressed() -> void:
	%RefreshButton.hide()
	$MazeGenerator.make_maze()
	$Player.position = _original_position


func _on_maze_generator_maze_completed() -> void:
	%RefreshButton.show()
