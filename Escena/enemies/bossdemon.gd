extends KinematicBody2D

export(int) var max_hp
export(int) var normal_speed = 50
export(int) var berserk_speed = 100
export(bool) var is_attacking = false

var current_health
var is_dead = false
var can_attack = true
var can_be_damaged = true
var dist_attack = 100
var velocity = Vector2()
var SPEED = 50
var GRAVITY = 10
var direction = 1

onready var animated_sprite = $Pivot/AnimatedSprite
onready var animation_player = $Pivot/AnimationPlayer
onready var archer = null
onready var animation_tree = $Pivot/AnimationTree
onready var pivot = $Pivot
onready var time_to_attack = $Time_to_attack
onready var inmunity_time = $Inmunity_time


onready var playback = animation_tree.get("parameters/playback")


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tree.active = true
	playback.travel("idle")
	current_health = max_hp
	SPEED = normal_speed
	
	
func _physics_process(_delta):
	if is_attacking:
		return
	if not is_dead:
		if archer != null:
			var pivot_sign = sign(position.direction_to(archer.position).x)
			var dist_archer = position.distance_to(archer.position)
			
			if dist_archer > 0:
				direction = pivot_sign
				pivot.scale.x = -direction
			
			if dist_archer > dist_attack:
				print("walk")
				playback.travel("walk")
			
			elif can_attack:
				attack()
				
			elif velocity.x == 0:
				print("idle")
				playback.travel("idle")
				
				
			velocity.x = SPEED * direction
			velocity.y += GRAVITY
			velocity = move_and_slide(velocity, Vector2.UP)

			


func dead():
	velocity.x = 0
	velocity.y = 0
	can_attack = false
	can_be_damaged = false
	is_dead = true
	print("death")
	playback.travel("death")
	yield(get_tree().create_timer(1.5),"timeout")
	queue_free()

	
	
func attack():
#	velocity.x = 0
#	velocity.y = 0
	print("sword_attack")
	playback.travel("sword_attack")
	is_attacking = true
	can_attack = false



func attack_timer():
	time_to_attack.start()
	print("entre")


func take_damage(_dmg):
	if can_be_damaged and current_health > 0:
		current_health -= 1
		
		if current_health <= 0:
			dead()	
			
		elif float(current_health)/max_hp <= 0.5:
			SPEED = berserk_speed
			
		else:
			print(animated_sprite.animation)
			playback.travel("damage_taken")
			can_be_damaged = false
			inmunity_time.start()
			
	


func _on_ArcherDetectionArea_body_entered(body):
	if body.is_in_group("Player") and archer==null:
		archer = body

		

func _on_Time_to_attack_timeout():
	print("timeout")
	can_attack = true
	is_attacking = false

func _on_Inmunity_time_timeout():
	can_be_damaged = true
	
	

