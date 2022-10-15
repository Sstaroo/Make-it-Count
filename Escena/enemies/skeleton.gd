extends KinematicBody2D

var velocity = Vector2()
var SPEED = 35
var GRAVITY = 10
var direction = 1
var is_dead = false
var health = 3
onready var Ray = $CollisionShape2D/RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("walking") 

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("dead")
	$CollisionShape2D.disabled = true
	$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, Vector2.UP)

		#Continuous movement
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if (collision.collider.collision_layer) & 8:
				health -= 1
		if health == 0:
			dead()
	if is_on_floor():
	#Stopping before falls
		if not Ray.is_colliding():
			direction = direction * -1
			Ray.position.x *= -1
	#Turning around when wall
		if is_on_wall():
			direction = direction * -1
			Ray.position.x *= -1



func _on_Timer_timeout():
	queue_free()
