extends KinematicBody2D

var velocity = Vector2()
var SPEED = 35
var GRAVITY = 10
var direction = 1
var is_dead = false
var health = 3
onready var Ray = $pivot/RayCast2D
onready var AnimSprite = $pivot/AnimatedSprite
onready var collShape = $CollisionShape2D
onready var timer = $Timer
onready var pivot = $pivot
# Called when the node enters the scene tree for the first time.
func _ready():
	AnimSprite.play("walking") 

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	AnimSprite.play("dead")
	collShape.disabled = true
	timer.start()


func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, Vector2.UP)

		#Continuous movement
#		AnimSprite.flip_h = direction !=1
		
	if is_on_floor():
	#Stopping before falls
		if not Ray.is_colliding():
			direction = direction * -1
			pivot.scale.x *= -1
	#Turning around when wall
		if is_on_wall():
			direction = direction * -1
			pivot.scale.x *= -1

func take_damage(dmg):
	health -= 1
	if health <= 0:
		dead()

func _on_Timer_timeout():
	queue_free()
