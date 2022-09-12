extends KinematicBody2D

export(PackedScene) onready var flecha

var velocity = Vector2()
var JUMP_SPEED = 230
var SPEED = 200
var GRAVITY = 10
onready var pivot = $Pivot
onready var sprite = $AnimatedSprite
onready var anim_player = $AnimationPlayer 
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")

onready var arrow_spawn = $Pivot/arrow_spawn

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	anim_tree.active = true
	# Replace with function body.
func _physics_process(delta):
	
	var move_input = Input.get_axis("move_left","move_right")
	
	velocity.x = lerp(move_input * SPEED, velocity.x, 0.8)
	
	velocity.y += GRAVITY 
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_SPEED
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		pivot.scale.x = 1
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		pivot.scale.x = -1



#ANIMATIONS
	if is_on_floor():
		if abs(velocity.x) > 100:
			playback.travel("run")
		else: 
			playback.travel("idle")
			if Input.is_action_just_pressed("low_attack"):
				playback.travel("low_attack")

	else:
		if velocity.y < 0:
			playback.travel("jump_start")
		else:
			playback.travel("jump_fall")
	

func _disparar():
	var arrow = flecha.instance()
	arrow.init(Vector2(200*pivot.scale.x,0), 1.0 ) # -> vector de velocidad que necesitemos
	get_parent().add_child(arrow)
	arrow.global_position = arrow_spawn.global_position
	if pivot.scale.x == -1:
		arrow.rotation = PI


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
