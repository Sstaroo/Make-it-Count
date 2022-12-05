extends Area2D


export (int) var g = 65
var velocity = Vector2.ZERO


func _physics_process(delta):
	velocity.y += delta * g
	position += velocity * delta
	
func _on_stones_body_entered(body):
	if body.is_in_group("Player"):
		body._health_loss()
	queue_free()

#$Animationplayer.play("Desaparecer")
#yield($AnimationPlayer,"animation_finished")
	
