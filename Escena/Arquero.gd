extends KinematicBody2D
var velocity = Vector2()
var JUMP_SPEED = 200
var SPEED = 200
var GRAVITY = 10


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var move_input = Input.get_axis("move_left","move_right")
	velocity.x = lerp(move_input * SPEED, velocity.x, 0.8)
	velocity.y += GRAVITY 
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_SPEED
	velocity = move_and_slide(velocity, Vector2.UP)
	
func disparar():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
