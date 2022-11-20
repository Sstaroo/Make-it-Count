extends Node2D

onready var archer = $Archer
export(PackedScene) onready var flecha_alta



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_death_fall_body_entered(body):
	archer.arrow_fall()

