extends Node2D

onready var menu = $Menu


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
		menu.connect("pressed",self,"_on_menu_pressed")
	# Replace with function body.

func _on_menu_pressed():
	get_tree().change_scene("res://Escena/iu/main_menu.tscn") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
