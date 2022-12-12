extends KinematicBody2D

var is_dead = false
var velocity = Vector2()
var health = 5

onready var AnimSprite = $AnimatedSprite
onready var archer = null


# Called when the node enters the scene tree for the first time.
func _ready():
	AnimSprite.play("idle1")


func dead():
	is_dead = true
	velocity = Vector2(0,0)
	AnimSprite.play("death")
	

func take_damage(_dmg):
	health -= 1
	if health <= 0:
		dead()
