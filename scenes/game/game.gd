extends Node2D

const SPEED = 50

export (PackedScene) var game_over
export (PackedScene) var flappy_bird
export (PackedScene) var bottles
var score = 0

func _ready():
	get_tree().paused = false

func _physics_process(delta):
	$ParallaxBackground.scroll_offset.x -= SPEED * delta
	$ParallaxBackground2.scroll_offset.x -= SPEED * delta

func add_score():
	score += 1
	$score.set_text(str(score))
	$score_audio.play()

func finish_game():
	add_child(game_over.instance())
	get_tree().paused = true

func start_game():
	$CanvasLayer.queue_free()
	add_child(flappy_bird.instance())
	add_child(bottles.instance())
