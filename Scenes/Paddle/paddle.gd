extends Area2D
class_name paddle

const SPEED: float = 200.0
const DOUBLE_SPEED: float = 400.0
const MARGIN: float = 50.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#if Input.is_action_pressed("move_left") == true:
		#position.x -= SPEED * _delta
	#if Input.is_action_pressed("move_right") == true:
		#position.x += SPEED * _delta
	var movement: float = Input.get_axis("move_left", "move_right")
	position.x += SPEED * _delta * movement
	if Input.is_action_pressed("sprint") == true:
		position.x += DOUBLE_SPEED * _delta * movement

	position.x = clampf(
		position.x,
		get_viewport_rect().position.x + MARGIN,
		get_viewport_rect().end.x - MARGIN
	)
