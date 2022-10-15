extends Node2D

onready var menu = $Menu


func _ready():
		menu.connect("pressed",self,"_on_menu_pressed")


func _on_menu_pressed():
	get_tree().change_scene("res://Escena/iu/main_menu.tscn") 


