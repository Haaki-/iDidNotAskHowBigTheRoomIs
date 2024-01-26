extends CharacterBody2D

var speed = 600

var direction
var bounced = 0

func _ready():
	velocity = direction.normalized() * speed

func _physics_process(_delta):
	var collision = move_and_collide(velocity * _delta)
	if collision:
		if bounced >= 1:

			queue_free()
		else:
			velocity = velocity.bounce(collision.get_normal())
			bounced += 1
		if collision.has_method("die"):
			collision.die()

	
func _on_VisibilityNotifier2D_screen_exited():
	# Deletes the bullet when it exits the screen.
	queue_free()
	
