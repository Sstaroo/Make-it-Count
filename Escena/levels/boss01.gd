extends Node2D
onready var portal = $portal_enter
onready var area_portal = $Area2D
onready var demon_boss = $demon_boss
onready var archer = $Archer

func _ready():
	credits()

	
func _on_Area2D_body_entered(_body):
	portal.visible = false
	area_portal.set_deferred("monitoring", false)
	if not portal.visible:
		portal.queue_free() 
		

func credits():
	if demon_boss.is_dead:
		get_tree().paused = true
		archer.congrats_1.visible = true


func _on_demon_boss_tree_exited():
		get_tree().paused = true
		archer.congrats_1.visible = true
		archer.congrats_1.animation_player.play("shadowing")
