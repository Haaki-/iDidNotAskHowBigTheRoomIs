extends CharacterBody2D

@onready var player = %SquareBoi

var health

@onready var _animation_player = $AnimationPlayer

func _process(delta):
	if velocity.is_zero_approx():
		_animation_player.play("idle")
	else:
		_animation_player.play("idle_2")

func _physics_process(_delta):

	var direction = global_position.direction_to(player.global_position)

	var target_velocity = direction * 100

	velocity += (target_velocity - velocity) * 0.1

	move_and_slide()
