extends Area2D

export (PackedScene) var skeleton
export (bool) var autospawn
export (float) var time_value
export (float) var num_of_spawn

onready var spawner = $spawner
onready var is_active

func _ready():
	is_active = false
	
func  execute():
	is_active = false
	autospawn = false
	

func _on_skeleton_spawn_body_entered(body):

	if body.is_in_group("Player") and num_of_spawn>0:
		is_active = true
		spawner.scene = skeleton
		if autospawn:
			spawner.start(time_value)
			num_of_spawn -= 1
			
		else:
			spawner.spawn()
			num_of_spawn -= 1
		
	if num_of_spawn <= 0:
		is_active = false
		autospawn = false
	
