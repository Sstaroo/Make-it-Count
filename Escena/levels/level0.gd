extends Node2D

onready var archer = $Archer
onready var flecha_alta_alta = $flecha_alta
onready var end_tutorial_dialog = $dialogues/arrow_importance
export(PackedScene) onready var flecha_alta




# Called when the node enters the scene tree for the first time.
func _ready():
	no_arrow()
	flecha_alta_alta.has_archer = false
	pass # Replace with function body.

func no_arrow():
	archer.has_arrow = false

func _on_death_fall_body_entered(_body):
	archer.tutorial = true
	archer.arrow_fall()
	end_tutorial_dialog.queue_free()


