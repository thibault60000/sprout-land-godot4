extends CharacterBody2D

@export var speed = 100
var player_state

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "top", "bottom")

	if (direction.x == 0 and direction.y == 0):
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"

	velocity = direction.normalized() * speed
	move_and_slide()

	play_anim(direction)

func play_anim(direction):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	elif player_state == "walking":
		if direction.y == 1:
			$AnimatedSprite2D.play("walk_up")
		if direction.y == -1:
			$AnimatedSprite2D.play("walk_down")
		if direction.x == 1:
			$AnimatedSprite2D.play("walk_right")
		if direction.x == -1:
			$AnimatedSprite2D.play("walk_left")
		
func player():
	pass
