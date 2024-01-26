extends CharacterBody2D

var speed = 600

var direction
var bounced = 0

func _ready():
	velocity = direction.normalized() * speed

func _physics_process(_delta):
	var collision = move_and_collide(velocity * _delta)
	if collision:
		if bounced >= 2:

			queue_free()
		else:
			velocity = velocity.bounce(collision.get_normal())
			bounced += 1
		var collider = collision.get_collider()
		if collider.has_method("take_damage"):
			collider.take_damage(1)
			collider.velocity += direction.normalized() * 500

	
func _on_VisibilityNotifier2D_screen_exited():
	# Deletes the bullet when it exits the screen.
	queue_free()
	
