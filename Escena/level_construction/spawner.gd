extends Position2D
export(PackedScene) var scene
onready var timer = $Timer

func _ready():
	timer.connect("timeout", self, "on_time_out")

func spawn():
	if scene:
		var instance = scene.instance()
		yield(get_tree().create_timer(0.5), "timeout")
		add_child(instance)
		instance.global_position = global_position

func on_time_out():
	spawn()
	
func start(time_value):
	timer.start(time_value)

func stop():
	timer.stop()
