extends CharacterBody2D

var speed = 20
var animal_state = "idle"

@export var idle_time: float = randi_range(2,5)
@export var walking_time: float = randi_range(1, 3)
@onready var timer = $Timer

var direction: Vector2 = Vector2.ZERO

func _ready():
	pick_new_state()
		
func select_new_direction():
	if (animal_state == "walking"):
		
		# Valeur random en X et Y
		direction = Vector2( 
			randi_range(-1, 1),
			randi_range(-1, 1)
		)

		# Tourner l'animation sur la gauche ou pas
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		elif direction.x >0:
			$AnimatedSprite2D.flip_h = false
			
func _physics_process(delta):
	velocity = direction * speed
	move_and_slide() # utilise "velocity" de "CharacterBody2D"

func pick_new_state():
	if animal_state == "walking":
		select_new_direction()
		$AnimatedSprite2D.play("walk_right")
		timer.start(walking_time)
	elif animal_state == "idle":
		$AnimatedSprite2D.play("idle")
		timer.start(idle_time)

func _on_timer_timeout():
	if (animal_state == "idle"):
		animal_state = "walking"
	elif (animal_state == "walking"):
		animal_state = "idle"

	pick_new_state()
