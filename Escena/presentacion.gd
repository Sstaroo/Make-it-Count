extends CenterContainer
onready var play = $VBoxContainer/Play

func _ready():
	play.connect("pressed",self,"_on_play_pressed")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_play_pressed():
	get_tree().change_scene("res://Escena/presenta/idea.tscn")

# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
