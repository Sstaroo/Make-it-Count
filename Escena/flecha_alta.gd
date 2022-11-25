extends KinematicBody2D

var SPEED = 400
export(int) var GRAVITY_factor = 2
export(int) var GRAVITY = 100

var velocity = Vector2(200, 0)
var arrow_bounce : float
var staystill = false

onready var particles = $CollisionShape2D/Sprite/Particles2D

onready var has_archer

func _ready() -> void:
	has_archer = false
	particles.emitting = true
	
func _physics_process(delta):
	if has_archer:
		particles.emitting = false
	if staystill:
		return
	rotation = velocity.angle()
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
		if arrow_bounce < 0.001 or (velocity.y>0 and velocity.y<50):
			staystill = true
		velocity.y *= -1*arrow_bounce
	if is_on_ceiling():
		if arrow_bounce < 0.001:
			staystill = true
		velocity.y *= -1*arrow_bounce
		

func not_tutorial():
	has_archer = true
	particles.emitting = false

func init(new_velocity : Vector2, new_bounce : float) -> void:
	velocity = new_velocity
	arrow_bounce = new_bounce


func _on_Area2D_body_entered(body):
	body.take_damage(1) 
