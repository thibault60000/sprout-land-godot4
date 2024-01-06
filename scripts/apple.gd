extends StaticBody2D


func _ready():
	fallingFromTree()

func fallingFromTree():
	$AnimationPlayer.play("fallingFromTree")
	await get_tree().create_timer(.6).timeout
	$AnimationPlayer.play("fade")
	print("+1 Apple")
	await get_tree().create_timer(0.3).timeout
	queue_free()
