extends Node2D


onready var archer = $Archer
onready var anim_playerlvl1 = archer.anim_player
onready var anim_treelvl1 = archer.anim_tree
onready var playback = anim_treelvl1.get("parameters/playback")
onready var portal_to_boss = $Portal_to_boss


# Called when the node enters the scene tree for the first time.
func _ready():
	portal_to_boss.is_active = true


func _input(event):
	if event.is_action_pressed("next_level"):
		get_tree().change_scene("res://Escena/levels/boss01.tscn")


func _on_death_fall_body_entered(body):
	if body.is_in_group("Player") or body.is_in_group("arrow"):
		archer.arrow_fall()

