extends RigidBody2D

const ENEMY = preload("res://scene/enemy_slime.tscn")

func spawn():
	var new_enemy = ENEMY.instantiate()
	%SpawnPoint.progress_ratio = randf()
	new_enemy.global_position = %SpawnPoint.global_position
	if new_enemy.has_method("set_size"):
		var slimeSizes = ["small", "medium", "large"]
		new_enemy.set_size(slimeSizes[randi() % slimeSizes.size()])
	get_parent().add_child(new_enemy)

func _on_timer_timeout():
	spawn()