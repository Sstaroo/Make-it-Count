extends Node2D
onready var portal = $portal_enter
onready var area_portal = $Area2D


func _on_Area2D_body_entered(body):
	if body.is_on_group("Player"):
		portal.visible = false
		area_portal.monitoring = false
	pass # Replace with function body.
