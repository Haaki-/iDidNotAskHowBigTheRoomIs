extends CharacterBody2D

@onready var target = get_node("/root/GameRoot/SquareBoi")

var health = 1

const CHASE_SPEED = 20
const WIGGLE_SPEED = 300

func _ready():
	%BurnoutTimer.start( randi() % 10 )


func _physics_process(_delta):

	var direction = global_position.direction_to(target.global_position) * CHASE_SPEED
	direction += Vector2( randf() - 0.5, randf() - 0.5 ) * WIGGLE_SPEED

	var target_velocity = direction

	velocity += (target_velocity - velocity) * 0.1

	move_and_slide()

func take_damage(damage):
	health -= damage
	
	if health <= 0:
		die()

func die():
	queue_free()

