extends KinematicBody2D


onready var animation_player = $Pivot/AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("idle")

