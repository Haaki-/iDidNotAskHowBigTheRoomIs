extends CharacterBody2D

func _physics_process(_delta):
	var direction = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown")
	direction = direction.normalized()
	velocity = direction * 600
	move_and_slide()
	
func _process(_delta):
	if Input.is_action_pressed("MoveLeft")
		_animation_player.play("MovingLeft")
	else:
		_animation_player.play("PlayerIdle")
		
		
