extends Area2D

const SPEED: float = 200.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var p_length: float = 1.0
var min_global_pos = p_length / 2
var screen_size = DisplayServer.window_get_size()
var max_global_pos = screen_size.x - min_global_pos
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#if Input.is_action_pressedc("move_left") == true:
		#position.x -= SPEED * _delta
	#if Input.is_action_pressed("move_right") == true:
		#position.x += SPEED * _delta
	var movement: float = Input.get_axis("move_left", "move_right")
	position.x += SPEED * _delta * movement
	global_position.x = clampf(global_position.x, min_global_pos, max_global_pos)

func update_min_max_global_position(p_length: float):
	min_global_pos = p_length / 2
	max_global_pos = screen_size.x - min_global_pos

func _on_area_entered(_area: Area2D) -> void:
	print("5")
