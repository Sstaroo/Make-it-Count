extends KinematicBody2D
var SPEED = 400
export(int) var GRAVITY_factor = 2
export(int) var GRAVITY = 100
var velocity = Vector2(200, 0)
var arrow_bounce : float
var staystill = false

func _ready() -> void:
	pass
func _physics_process(delta):
	if staystill:
		return
	rotation = velocity.angle()
	print(is_on_floor())
	if velocity.y > 0:
		velocity.y += GRAVITY*delta*GRAVITY_factor
	else:
		velocity.y += GRAVITY*delta
	move_and_slide(velocity,Vector2.UP)
	
	if is_on_wall():
		if arrow_bounce < 0.001:
			staystill = true
		velocity.x *= -1*arrow_bounce
	if is_on_floor():
		print(velocity.y)
		if arrow_bounce < 0.001 or (velocity.y>0 and velocity.y<50):
			staystill = true
		velocity.y *= -1*arrow_bounce
	if is_on_ceiling():
		if arrow_bounce < 0.001:
			staystill = true
		velocity.y *= -1*arrow_bounce
		
#func _end_arrow():
#	queue_free()

func init(new_velocity : Vector2, new_bounce : float) -> void:
	velocity = new_velocity
	arrow_bounce = new_bounce
