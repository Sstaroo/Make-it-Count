extends RigidBody2D

var SPEED = 400

var velocity = Vector2(200, 0)
var arrow_bounce : float


func _ready() -> void:
	linear_velocity = velocity
	bounce = arrow_bounce
	

func init(new_velocity : Vector2, new_bounce : float) -> void:
	velocity = new_velocity
	arrow_bounce = new_bounce
	
	
	
	


# dar par velocity, 
