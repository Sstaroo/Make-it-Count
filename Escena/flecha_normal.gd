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
	
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
