extends CharacterBody2D


#Movement
func _physics_process(_delta):
	var direction = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown")
	direction = direction.normalized()
	velocity = direction * 600
	move_and_slide()
	
	
#Movement-dependent animation
@onready var _animation_player = $AnimationPlayer
	
func _process(delta):
	if Input.is_action_pressed("MoveLeft"):
		_animation_player.play("MovingLeft")
	elif Input.is_action_pressed("MoveRight"):
		_animation_player.play("MovingRight")
	elif Input.is_action_pressed("MoveUp"):
		_animation_player.play("MovingUp")
	elif Input.is_action_pressed("MoveDown"):
		_animation_player.play("MovingDown")
	else:
		_animation_player.play("PlayerIdle")
		
	if Input.is_action_just_pressed("Shoot"):
		shoot()
		
#Attempt at bullet shooting
const bulletPath = preload("res://Scene/anti_fireball.tscn")

func shoot ():
	var bullet = bulletPath.instantiate()
	
	get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position 
	
	bullet.velocity = get_global_mouse_position() - bullet.position
