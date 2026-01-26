extends Node2D
class_name game

@onready var player: AudioStreamPlayer = $Player
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var spawn_timer: Timer = $Timer
@onready var label: Label = $Label


const GEM = preload("uid://bunym2grw75ea")
const MARGIN: float = 70.0
const EXPLODE = preload("uid://dp6q76xp3853b")

var _score: int = 0

func _ready() -> void:
	spawn_gem()
	pass

func spawn_gem() -> void:
	var new_gem: Gem = GEM.instantiate()
	var x_pos: float = randf_range(
		get_viewport_rect().position.x + MARGIN,
		get_viewport_rect().end.x - MARGIN)
	new_gem.position = Vector2(x_pos, -50)
	new_gem.gem_off_screen.connect(_on_gem_off_screen)
	add_child(new_gem)

func stop_all() -> void:
	spawn_timer.stop()
	player.stop()
	player.stream = EXPLODE
	player.pitch_scale = 0.0
	player.volume_db = 1.0
	player.play()
	for child in get_children():
		if child is Gem or paddle:
			child.set_process(false)

func _on_paddle_area_entered(area: Area2D) -> void:
	_score += 1
	label.text = "%03d" % _score
	score_sound.position = area.position
	score_sound.play()
	print("Game:: collision")

func _on_gem_off_screen() -> void:
	stop_all()
	print("Game Over")

func _on_timer_timeout() -> void:
	spawn_gem()
	print("Gem spawned")
