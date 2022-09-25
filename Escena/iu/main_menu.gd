extends CenterContainer
onready var play = $VBoxContainer/Play
onready var credits = $VBoxContainer/Credits
onready var exit = $VBoxContainer/Exit
onready var tutorial = $VBoxContainer/Tutorial

func _ready():
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
	play.connect("pressed",self,"_on_play_pressed")
	credits.connect("pressed",self,"_on_credits_pressed")
	exit.connect("pressed",self,"_on_exit_pressed")
	tutorial.connect("pressed",self,"_on_tutorial_pressed")



func _on_credits_pressed():
	print ("Escuadron Carpincho")
func _on_play_pressed():
	get_tree().change_scene("res://Escena/main.tscn")

func _on_exit_pressed():
	get_tree().quit()
	
func _on_tutorial_pressed():
	get_tree().change_scene("res://Escena/tutorial.tscn")
