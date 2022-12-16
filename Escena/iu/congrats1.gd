extends CenterContainer


onready var congrats_1 = $"."
onready var animation_player = $Panel/AnimationPlayer



func _ready():
	congrats_1.visible = false

func credits():
	yield(get_tree().create_timer(5), "timeout")
	get_tree().paused = false
	get_tree().change_scene("res://Escena/iu/credits.tscn")

	
