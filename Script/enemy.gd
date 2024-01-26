extends CharacterBody2D

@onready var target = get_node("/root/GameRoot/SquareBoi")

var health

# @onready var _animation_player = $AnimationPlayer

# func _process(_delta):
# 	if velocity.is_zero_approx():
# 		# _animation_player.play("idle")
# 	if velocity.is_normalized():
# 		# _animation_player.play("idle")

func _physics_process(_delta):

	var direction = global_position.direction_to(target.global_position)

	var target_velocity = direction * 100

	velocity += (target_velocity - velocity) * 0.1

	move_and_slide()

func die():
	print("Hey")
	queue_free()