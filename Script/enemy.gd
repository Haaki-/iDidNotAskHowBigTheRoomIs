extends CharacterBody2D

@onready var player = %SquareBoi

var health

func _ready():
	play()
	

func _physics_process(_delta):

	var direction = global_position.direction_to(player.global_position)

	var target_velocity = direction * 100

	velocity += (target_velocity - velocity) * 0.1

	move_and_slide()
