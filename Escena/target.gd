extends Area2D

export(NodePath) var target_target

var is_active = true
onready var anim_tree = $AnimationTree
onready var anim_player = $AnimationPlayer

func _ready():
	state()
func state():
	if is_active:
		anim_player.play("active")
	else:
		anim_player.play("inactive")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_target_body_entered(body):
	if not body.is_in_group("not_target"):
		is_active = false
		state()
	
