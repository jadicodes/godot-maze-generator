# Godot 4.3 Maze Generator
Jadi Miller

## How Do I Interact With This?
For ease of access, I uploaded this to my [itch.io page](https://prismatoad.itch.io/maze-generator). The one there is outdated because at time of completion, itch.io was down.

## How Does This Work?
To build this maze generator, I used a recursive backtracking algorithm. I then added collision to the tile map and a pink square that can be controlled by the user using WASD. I then played with different types of mazes that can be made with this, and decided I wanted there to be an interactive element. To do this, I would need space between each of the maze paths. I learned how to make the maze double spaced. 

To spawn the interactable elements, after the maze generation is over, I collect all of the "blank spaces" that the player can't walk on and choose 3 to spawn interactables on.

## What Have I Learned?

1. I learned recursive backtracking. We had learned about it in class, but the learning really happened when I implemented it by hand. I followed [this walkthrough](https://kidscancode.org/blog/2018/08/godot3_procgen1/), which is for implementing a maze generator into Godot 3. I had to change a few things so that the algorithm worked in Godot 4.3. Mostly, I had to update the bitwise operations and change to the new TileMapLayer node that replaced TileMap in Godot 4.3.
