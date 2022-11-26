extends KinematicBody2D

onready var father = $"../.."
onready var path_follow = $".."
onready var is_dead = false
onready var anim_sprite = $"../AnimatedSprite"
onready var anim_play = $"../AnimationPlayer"
onready var health = 1
onready var collShape = $CollisionShape2D


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if is_dead:
		anim_play.play("die")
		collShape.disabled = true
	else:
		path_follow.offset += 20*delta
		anim_sprite.play("idle")
		pass

func take_damage(_dmg):
	health -= 1
	if health <= 0:
		is_dead = true

func _on_AnimationPlayer_animation_finished(_anim_name):
	father.queue_free()
