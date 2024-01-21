extends CharacterBody2D

func _physics_process(_delta):
	var direction = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown")
	direction = direction.normalized()
	velocity = direction * 600
	move_and_slide()
	
@onready var _animation_player = $AnimationPlayer
	
func _process(_delta):
	if Input.is_action_pressed("MoveLeft"):
		_animation_player.play("MovingLeft")
	if Input.is_action_pressed("MoveRight"):
		_animation_player.play("MovingRight")
	if Input.is_action_pressed("MoveUp"):
		_animation_player.play("MovingUp")
	if Input.is_action_pressed("MoveDown"):
		_animation_player.play("MovingDown")
	else:
		_animation_player.play("PlayerIdle")
		
		
