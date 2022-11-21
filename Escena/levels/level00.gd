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
	archer.arrow_fall()



func _on_Area2D_body_entered(body):
	$jump_dialo/jump_timer.start(1)
	


func _on_jump_timer_timeout():
	pass # Replace with function body.
