extends CenterContainer


onready var restart = $VBoxContainer/Restart
onready var main_menu = $VBoxContainer/Main_menu
onready var exit = $VBoxContainer/Exit
onready var but = $VBoxContainer/but
onready var anim_play = $Panel/AnimationPlayer

func _ready():
	restart.connect("pressed",self,"_on_restart_pressed")
	main_menu.connect("pressed",self,"_on_main_menu_pressed")
	exit.connect("pressed",self,"_on_Exit_pressed")
	but.connect("pressed",self,"_on_main_menu_pressed")
	
	hide()
	anim_play.play("shadowing")
	

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
	get_tree().quit() 
