extends CharacterBody2D

var speed = 600

var direction

func _ready():
	velocity = direction.normalized() * speed

func _physics_process(_delta):
	var collision = move_and_collide(velocity * _delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	
func _on_VisibilityNotifier2D_screen_exited():
	# Deletes the bullet when it exits the screen.
	queue_free()
	
