extends Node2D

const ENEMY = preload("res://Scene/Enemies/enemy_flame.tscn")

func spawn():
	var new_flame = ENEMY.instantiate()
	new_flame.health = 1
	%SpawnPoint.progress_ratio = randf()
	new_flame.global_position = %SpawnPoint.global_position
	get_node("/root/GameRoot/").add_child(new_flame)

func _on_timer_timeout():
	spawn()
