extends Node2D


onready var archer = $Archer
onready var anim_playerlvl1 = archer.anim_player
onready var anim_treelvl1 = archer.anim_tree
onready var playback = anim_treelvl1.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_death_fall_body_entered(_body):
	archer.arrow_fall()
	get_tree().paused = true
	archer._death_menu_visible()
