extends KinematicBody2D

var velocity = Vector2()
var SPEED = 35
var GRAVITY = 10
var direction = 1
onready var Ray = $CollisionShape2D/RayCast2D
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("walking") # Replace with function body.
func _physics_process(delta):
	velocity.x = SPEED * direction
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity)
	
	#Continuous movement
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true

	
	#Stopping before falls
	if Ray.is_colliding() == false:
		direction = direction * -1
		Ray.position.x *= -1
	#Turning around when wall
	if is_on_wall():
		direction = direction * -1
		Ray.position.x *= -1
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
