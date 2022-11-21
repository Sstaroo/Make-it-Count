extends KinematicBody2D


onready var animation = $AnimationPlayer
onready var anim_sprite = $pivote/AnimatedSprite


func _ready():
	anim_sprite.play("idle")
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		animation.play("pass")
	elif body.is_in_group("arrow"):
		animation.play("hit")
