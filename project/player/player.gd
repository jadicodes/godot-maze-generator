extends CharacterBody2D


var speed = 200.0
var _original_position: Vector2


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

	move_and_slide()
