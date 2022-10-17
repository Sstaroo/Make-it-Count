extends CenterContainer


onready var restart = $VBoxContainer/Restart
onready var main_menu= $VBoxContainer/MainMenu

func _ready():
	restart.connect("pressed",self,"_on_restart_pressed")
	main_menu.connect("pressed",self,"_on_main_menu_pressed")
	
	hide()

func highlight_button():
	visible = true
	restart.grab_focus()
	get_tree().paused = true
	
func _on_restart_pressed():
	get_tree().change_scene("res://Escena/level01.tscn")
	get_tree().paused = false
	
func _on_main_menu_pressed():
	get_tree().change_scene("res://Escena/iu/main_menu.tscn")
	get_tree().paused = false
	

func _on_Exit_pressed():
	get_tree().quit() # Replace with function body.
