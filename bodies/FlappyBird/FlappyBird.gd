extends KinematicBody2D

const FLY = 150
const GRAVITY = 400
var mov = Vector2.ZERO
var is_dead = false

func _physics_process(delta):
	if is_dead:
		$AnimatedSprite.play("dead")
		$hit.play()
		get_parent().finish_game()
	else:
		mov.y += GRAVITY * delta
		mov.y = clamp(mov.y, -GRAVITY, GRAVITY)
		if Input.is_action_just_pressed("clic"):
			$fly.play()
			mov.y = -FLY
			if $AnimatedSprite.animation == "fly":
				$AnimatedSprite.frame = 0
				$AnimatedSprite.play("fly")
			else:
				$AnimatedSprite.play("fly")
		mov = move_and_slide(mov)
		if get_slide_count() > 0:
			is_dead = true
