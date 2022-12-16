extends MarginContainer

var scroll_speed = 1
var scroll_ended = false

onready var scroll_container = $ScrollContainer


func _ready():
	scroll_container.scroll_vertical = 0;
	set_physics_process(false)
	yield(get_tree().create_timer(1.5), "timeout")
	set_physics_process(true)

func _physics_process(delta):
	var last_scroll = scroll_container.scroll_vertical
	scroll_container.scroll_vertical += scroll_speed
	var new_scroll = scroll_container.scroll_vertical
	if (last_scroll == new_scroll):
		_to_main_menu()


func _to_main_menu():
	if not scroll_ended:
		scroll_ended = true
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://Escena/iu/main_menu.tscn")
