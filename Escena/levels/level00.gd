extends Node2D

onready var archer = $Archer
export(PackedScene) onready var flecha_alta



# Called when the node enters the scene tree for the first time.
func _ready():
	no_arrow()
	pass # Replace with function body.

func no_arrow():
	archer.has_arrow = false

func _on_death_fall_body_entered(body):
	archer.arrow_fall_on_tutorial()



