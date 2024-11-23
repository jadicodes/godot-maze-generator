extends Control


func _ready():
	%RefreshButton.hide()


func _on_refresh_button_pressed() -> void:
	%RefreshButton.hide()
	$MazeGenerator.make_maze()


func _on_maze_generator_maze_completed() -> void:
	%RefreshButton.show()
