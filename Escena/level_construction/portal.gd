extends KinematicBody2D

export(PackedScene) onready var scene

var is_active = false

onready var _animation_player = $AnimationPlayer


func _ready():
	_animation_player.play("Cycle")


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player") and is_active:
		get_tree().change_scene_to(scene)
		is_active = false
	pass # Replace with function body.
