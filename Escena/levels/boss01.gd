extends Node2D
onready var portal = $portal_enter
onready var area_portal = $Area2D

func _ready():
	pass


func _on_Area2D_body_entered(_body):
	portal.visible = false
	area_portal.set_deferred("monitoring", false)
	if not portal.visible:
		portal.queue_free() 
		
