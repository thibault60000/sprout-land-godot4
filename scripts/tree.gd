extends Node2D

var state = "full" # or empty
var player_is_in_area = false

func _ready():
	if state == "empty":
		$Timer.start()
		
func _process(delta):
	if state == "empty":
		$AnimatedSprite2D.play("empty")
	elif state == "full":
		$AnimatedSprite2D.play("full")
		if (player_is_in_area):
			if Input.is_action_just_pressed("action"):
				state = "empty"
				$Label.visible = false
				$Timer.start()
				
func _on_area_2d_body_entered(body):
	if body.has_method("player"):
			player_is_in_area = true
			if state == "full":
				$Label.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_is_in_area = false
		$Label.visible = false



func _on_timer_timeout():
	if state == "empty":
		state = "full"
			


# https://www.youtube.com/watch?v=B91iuXU3AZ0
