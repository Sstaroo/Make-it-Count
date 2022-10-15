extends KinematicBody2D

var velocity = Vector2()
var SPEED = 35
var GRAVITY = 10
var direction = 1

onready var Ray = $CollisionShape2D/RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("walking") # Replace with function body.
func _physics_process(delta):
	velocity.x = SPEED * direction
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, Vector2.UP)

	#Continuous movement
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	if is_on_floor():
	#Stopping before falls
		if not Ray.is_colliding():
			direction = direction * -1
			Ray.position.x *= -1
	#Turning around when wall
		if is_on_wall():
			direction = direction * -1
			Ray.position.x *= -1
