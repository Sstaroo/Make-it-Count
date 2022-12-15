extends Position2D

export(PackedScene) var scene
export (bool) var loop = false
export (float) var timespawn
export (float) var spawnfrecuency



onready var timer = $Timer

func _ready():
	timer.connect("timeout", self, "on_time_out")
	start(timespawn)
	
func execute():
	stop()


func spawn():
	if scene:
		var instance = scene.instance()
		yield(get_tree().create_timer(0.5), "timeout")
		add_child(instance)
		instance.global_position = global_position

func on_time_out():
	if spawnfrecuency>0:
		spawn()
		spawnfrecuency -= 1
	else:
		stop()
		
	
func start(time_value):
	timer.start(time_value)

func stop():
	timer.stop()
