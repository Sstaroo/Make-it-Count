extends CenterContainer
onready var next = $laidea/next

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	next.connect("pressed",self,"_on_next_pressed")
	# Replace with function body.

func _on_next_pressed():
	get_tree().change_scene("res://Escena/iu/main_menu.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
