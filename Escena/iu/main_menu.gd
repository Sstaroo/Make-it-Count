extends CenterContainer
onready var play = $VBoxContainer/Play
onready var credits = $VBoxContainer/Credits
onready var exit = $VBoxContainer/Exit

func _ready():
	play.connect("pressed",self,"_on_play_pressed")
	credits.connect("pressed",self,"_on_credits_pressed")
	exit.connect("pressed",self,"_on_exit_pressed")

func _on_credits_pressed():
	print ("Escuadron Carpincho")
func _on_play_pressed():
	get_tree().change_scene("res://Escena/main.tscn")

func _on_exit_pressed():
	get_tree().quit()
