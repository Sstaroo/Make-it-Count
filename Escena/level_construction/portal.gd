extends KinematicBody2D
export(PackedScene) onready var scene
onready var _animation_player = $AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	_animation_player.play("Cycle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_on_group("Player"):
		get_tree().change_scene_to(scene)
	pass # Replace with function body.
