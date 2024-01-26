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

	var direction = Vector2( randf() - 0.5, randf() - 0.5 )

	var target_velocity = direction * 200

	velocity += (target_velocity - velocity) * 0.1

	move_and_slide()

func die():
	queue_free()
