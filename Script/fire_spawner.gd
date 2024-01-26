extends Node2D

const ENEMY = preload("res://Scene/Enemies/enemy_flame.tscn")

func spawn():
	var new_enemy = ENEMY.instantiate()
	%SpawnPoint.progress_ratio = randf()
	new_enemy.global_position = %SpawnPoint.global_position
	get_node("/root/GameRoot/").add_child(new_enemy)

func _on_timer_timeout():
	spawn()