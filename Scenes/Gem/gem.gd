extends Area2D

class_name Gem

signal gem_off_screen

const SPEED: float = 200.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.y += SPEED * _delta
	if position.y > get_viewport_rect().end.y:
		print("Gem falls off")
		gem_off_screen.emit()
		die()

func die() -> void:
		set_process(false)
		queue_free()

func _on_area_entered(_area: Area2D) -> void:
	print("Gem hit paddle")
	die()
