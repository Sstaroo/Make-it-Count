extends KinematicBody2D

export(Vector2) var offset_normal
export(Vector2) var offset_attack
export(int) var dist_attack

var velocity = Vector2()
var SPEED = 35
var GRAVITY = 10
var direction = 1
var is_dead = false
var health = 1
var is_attack = false
var can_attack = true

onready var Ray = $pivot/RayCast2D
onready var AnimSprite = $pivot/AnimatedSprite
onready var collShape = $CollisionShape2D
onready var timer = $Timer
onready var pivot = $pivot
onready var archer = null
onready var sword_collision = $pivot/Area2D/CollisionShape2D

func _ready():
	AnimSprite.play("walking") 
	sword_collision.set_deferred("disabled", true)

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	AnimSprite.play("dead")
	collShape.queue_free()
	timer.start()


func _physics_process(_delta):
	if is_attack:
		return
	if not is_dead:
		if archer != null:
			var pivot_sign = sign(position.direction_to(archer.position).x)
			var dist_archer = position.distance_to(archer.position)
			if can_attack and dist_archer <= dist_attack:
				attack()
			if pivot_sign != 0:
				direction = pivot_sign
		velocity.x = SPEED * direction
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, Vector2.UP)
		
	if is_on_floor():
	#Stopping before falls
		if not Ray.is_colliding():
			direction = direction * -1
	#Turning around when wall
		if is_on_wall():
			direction = direction * -1
		pivot.scale.x = direction

func attack():
	$pivot/AnimationPlayer.play("attack")
	AnimSprite.offset = offset_attack
	is_attack = true
	can_attack = false
	$time_to_attack.start()
	
func take_damage(_dmg):
	health -= 1
	if health <= 0:
		dead()

func _on_Timer_timeout():
	queue_free()


func _on_ArcherDetectionArea_body_entered(body):
	if body.is_in_group("Player"):
		archer = body


func _on_ArcherDetectionArea_body_exited(body):
	if body.is_in_group("Player"):
		archer = null


func _on_time_to_attack_timeout():
	can_attack = true


func _on_AnimatedSprite_animation_finished():
	if AnimSprite.animation == "attack":
		is_attack = false
		AnimSprite.play("walking")
		AnimSprite.offset = offset_normal


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		is_attack = false
		AnimSprite.play("walking")
		AnimSprite.offset = offset_normal
