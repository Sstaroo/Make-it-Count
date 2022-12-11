extends Area2D


export (int) var g = 10
export (int) var initial_velocity= 480
var velocity = Vector2.ZERO

func _ready():
	velocity.y=initial_velocity

func _physics_process(delta):
	velocity.y += delta * g
	position += velocity * delta
	
func _on_stones_body_entered(body):
	if body.is_in_group("Player"):
		body._health_loss()
	queue_free()

#$Animationplayer.play("Desaparecer")
#yield($AnimationPlayer,"animation_finished")
	
