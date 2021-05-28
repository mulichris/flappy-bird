extends StaticBody2D

const SPEED = 200

func _ready():
	$Area2D.connect("body_entered", self, "body_entered")

func _physics_process(delta):
	global_position.x -= SPEED * delta
	if global_position.x <= -25:
		global_position.x += 313
		global_position.y = randi()%250

func body_entered(body):
	get_parent().add_score()
