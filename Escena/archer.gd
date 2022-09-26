extends KinematicBody2D

export(PackedScene) onready var flecha
export(PackedScene) onready var flecha_normal
export(PackedScene) onready var flecha_alta

var velocity = Vector2()
var JUMP_SPEED = 230
var SPEED = 200
var GRAVITY = 10
onready var pivot = $Pivot
onready var sprite = $AnimatedSprite
onready var anim_player = $AnimationPlayer 
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")

export(int) var x_high = 150
export(int) var y_high = -100
export(int) var x_normal = 200
export(int) var y_normal = 0
export(int) var x_down = 250
export(int) var y_down = 0


onready var arrow_spawn = $Pivot/arrow_spawn
onready var high_spawn = $Pivot/high_arrow_spawn
onready var normal_spawn = $Pivot/normal_arrow_spawn

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
			if Input.is_action_just_pressed("high_attack"):
				playback.travel("high_attack")
			if Input.is_action_just_pressed("normal_attack"):
				playback.travel("normal_attack")

	else:
		if velocity.y < 0:
			playback.travel("jump_start")
		else:
			playback.travel("jump_fall")
	

func _disparar():
	var arrow = flecha.instance()
	arrow.init(Vector2(x_down*pivot.scale.x,y_down*pivot.scale.y), 1.0 ) # -> vector de velocidad que necesitemos
	get_parent().add_child(arrow)
	arrow.global_position = arrow_spawn.global_position
	if pivot.scale.x == -1:
		arrow.rotation = PI

func _disparar_high():
	var arrow_alta = flecha_alta.instance()
	arrow_alta.init(Vector2(x_high*pivot.scale.x,y_high*pivot.scale.y), 0.3 ) # -> vector de velocidad que necesitemos
	get_parent().add_child(arrow_alta)
	arrow_alta.global_position = high_spawn.global_position
	if pivot.scale.x == -1:
		arrow_alta.rotation = PI


func _disparar_normal():
	var arrow_normal = flecha_normal.instance()
	arrow_normal.init(Vector2(x_normal*pivot.scale.x,y_normal*pivot.scale.y), 1.0 ) # -> vector de velocidad que necesitemos
	get_parent().add_child(arrow_normal)
	arrow_normal.global_position = normal_spawn.global_position
	if pivot.scale.x == -1:
		arrow_normal.rotation = PI
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
