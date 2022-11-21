extends KinematicBody2D

onready var father = $"../.."
onready var path_follow = $".."
onready var alive = true
onready var anim_sprite = $"../AnimatedSprite"
onready var anim_play = $"../AnimationPlayer"
onready var health = 1
onready var collShape = $CollisionShape2D


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if alive:
		path_follow.offset += 20*delta
		anim_sprite.play("idle")
	else:
		anim_play.play("die")
		collShape.disabled = true
		pass

func take_damage(dmg):
	health -= 1
	if health <= 0:
		alive = false





func _on_AnimationPlayer_animation_finished(anim_name):
	father.queue_free()
