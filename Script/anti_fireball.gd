extends CharacterBody2D

var velocityBullet = Vector2(0, 0)
var speed = 300


func _physics_process(delta):
	var collision = move_and_collide(velocityBullet.normalized() * delta * speed)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	
func _on_VisibilityNotifier2D_screen_exited():
	# Deletes the bullet when it exits the screen.
	queue_free()
	
