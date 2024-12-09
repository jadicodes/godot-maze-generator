# Godot 4.3 Maze Generator
Jadi Miller

## How Do I Interact With This?
For ease of access, I uploaded this to my [itch.io page](https://prismatoad.itch.io/maze-generator). The one there is outdated because at time of completion, itch.io was down.

## How Does This Work?
To build this maze generator, I used a recursive backtracking algorithm. I then added collision to the tile map and a pink square that can be controlled by the user using WASD. I then played with different types of mazes that can be made with this, and decided I wanted there to be an interactive element. To do this, I would need space between each of the maze paths. I learned how to make the maze double spaced. 

To spawn the interactable elements, after the maze generation is over, I collect all of the "blank spaces" that the player can't walk on and choose 3 to spawn interactables on.
