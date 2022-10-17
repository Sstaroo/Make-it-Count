extends MarginContainer

onready var resume = $VBoxContainer/Resume
onready var main_menu= $VBoxContainer/MainMenu
onready var exit = $VBoxContainer/Exit

func _ready():
	resume.connect("pressed",self,"_on_resume_pressed")
	main_menu.connect("pressed",self,"_on_main_menu_pressed")
	exit.connect("pressed",self,"_on_exit_pressed")
	
	hide()
func _input(event):
	if event.is_action_pressed("pause"):
		visible = !visible
		resume.grab_focus()
		get_tree().paused = visible
		
	
func _on_resume_pressed():
	hide()
	get_tree().paused = false
	
func _on_main_menu_pressed():
	get_tree().change_scene("res://Escena/iu/main_menu.tscn")
	get_tree().paused = false
func _on_exit_pressed():
	get_tree().quit()
