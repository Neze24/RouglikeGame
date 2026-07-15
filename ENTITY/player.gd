extends CharacterBody2D

var speed = 200
var attacking = false

@onready var animation = $AnimatedSprite2D
func _ready():
	animation.animation_finished.connect(_on_animated_sprite_2d_animation_finished)

func _physics_process(delta):
	
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

	if Input.is_action_just_pressed("attack") and !attacking:
		attacking = true
		animation.play("attack")

	if !attacking:
		velocity = input_direction * speed

		if velocity == Vector2.ZERO:
			animation.play("idle")
		else:
			animation.play("run")
	else:
		velocity = Vector2.ZERO

	if velocity.x < 0:
		animation.flip_h = true
	elif velocity.x > 0:
		animation.flip_h = false
	print(animation.sprite_frames.get_animation_names())
	move_and_slide()

func _on_animated_sprite_2d_animation_finished():
	print("Animation finished:", animation.animation)
	if animation.animation == "attack":
		attacking = false
