extends CharacterBody2D

var speed = 200
@onready var animation = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	velocity = input_direction * speed
	if (velocity == Vector2.ZERO):
		animation.play("idle")
	else :
		animation.play("run")
		
	if velocity.x < 0:
		animation.flip_h = true
	elif velocity.x > 0:
		animation.flip_h = false
		

	move_and_slide()
