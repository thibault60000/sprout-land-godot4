extends Node2D

var state = "full" # or empty
var player_is_in_area = false

const APPLE = preload("res://scenes/apple.tscn")
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
				drop_apple()
				$Label.visible = false
				
func _on_area_2d_body_entered(body):
	if body.has_method("player"):
			player_is_in_area = true
			if state == "full":
				$Label.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_is_in_area = false
		$Label.visible = false

func drop_apple():
	var apple_instance1 = APPLE.instantiate()
	apple_instance1.global_position = $MarkerApple1.global_position
	get_parent().add_child(apple_instance1)
	
	
	var apple_instance2 = APPLE.instantiate()
	apple_instance2.global_position = $MarkerApple2.global_position
	get_parent().add_child(apple_instance2)
	
	
	var apple_instance3 = APPLE.instantiate()
	apple_instance3.global_position = $MarkerApple3.global_position
	get_parent().add_child(apple_instance3)
	
	await get_tree().create_timer(1.5).timeout
	$Timer.start()

	#
	#await get_tree().create_timer(3).timeout
	#$Timer.start()

func _on_timer_timeout():
	if state == "empty":
		state = "full"
