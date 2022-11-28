extends Area2D

export (PackedScene) var enemy
export(bool) var autospawn
export (float) var time_value

onready var spawner = $spawner

func _ready():
	pass # Replace with function body.

func _on_skeleton_spawn_body_entered(body):
	if body.is_on_group("Player") and not autospawn:
		spawner.spawn()
	if body.is_on_group("Player") and autospawn:
		spawner.start(time_value)
