extends Node2D
onready var portal = $portal_enter
onready var area_portal = $Area2D

func _ready():
	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		yield(get_tree().create_timer(1.5), "timeout")
		portal.visible = false
		area_portal.monitoring = false

