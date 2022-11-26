extends Area2D
export(String) var dialogue
export(float) var time_wait

onready var is_active = false


func _ready():
	$Label.text = dialogue
	$Label.modulate = Color(1,1,1,0)
	$Timer.wait_time = time_wait
	pass # Replace with function body.



func _on_label_dialogues_body_entered(_body):
	$Timer.start()


func _on_Timer_timeout():
	var playerinArea = false
	for a in get_overlapping_bodies():
		playerinArea = true
	if playerinArea:
		$AnimationPlayer.play("appear")
		pass
