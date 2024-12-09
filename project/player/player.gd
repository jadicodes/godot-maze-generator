extends CharacterBody2D


var speed = 100.0
var _original_position: Vector2
var _points = 0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if Input.is_action_just_pressed("left"):
		_rotate_grabber(90)
	if Input.is_action_just_pressed("right"):
		_rotate_grabber(270)
	if Input.is_action_just_pressed("down"):
		_rotate_grabber(0)
	if Input.is_action_just_pressed("up"):
		_rotate_grabber(180)


	move_and_slide()


func _rotate_grabber(angle):
	$Grabber.rotation_degrees = angle


func _on_grabber_body_entered(body) -> void:
	if body is Grabbable:
		body.queue_free()


func set_points(points):
	_points = points


func get_points() -> int:
	return _points
