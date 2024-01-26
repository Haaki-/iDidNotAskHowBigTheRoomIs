extends Node2D

const ENEMY = preload("res://Scene/Enemies/enemy_slime.tscn")

func spawn():
	var new_slime = ENEMY.instantiate()
	%SpawnPoint.progress_ratio = randf()
	new_slime.global_position = %SpawnPoint.global_position
	if new_slime.has_method("set_size"):
		var slimeSizes = ["small", "medium", "large"]
		new_slime.set_size(slimeSizes[randi() % slimeSizes.size()])
	get_node("/root/GameRoot/").add_child(new_slime)

func _on_timer_timeout():
	spawn()
