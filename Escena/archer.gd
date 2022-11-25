extends KinematicBody2D

export(PackedScene) onready var flecha
export(PackedScene) onready var flecha_normal
export(PackedScene) onready var flecha_alta


var velocity = Vector2()
var SPEED = 200
var GRAVITY = 10

onready var pivot = $Pivot
onready var sprite = $Pivot/AnimatedSprite
onready var anim_player = $AnimationPlayer 
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")

onready var death_menu = $Lifes/death_menu
onready var death_tutorial = $Lifes/tutorial_death
onready var heart_1 =$Lifes/Lives/heart_1
onready var heart_2 =$Lifes/Lives/heart_2
onready var heart_3 =$Lifes/Lives/heart_3
onready var hearts = [heart_1, heart_2, heart_3]
onready var tutorial 



export(int) var x_high = 150
export(int) var y_high = -100
export(int) var x_normal = 200
export(int) var y_normal = 0
export(int) var x_down = 250
export(int) var y_down = 0
export(bool) var has_arrow = true
export(int) var JUMP_SPEED = 230

onready var arrow_spawn = $Pivot/arrow_spawn
onready var high_spawn = $Pivot/high_arrow_spawn
onready var normal_spawn = $Pivot/normal_arrow_spawn

onready var actual_level = get_parent()
onready var camera = $Camera2D



func _ready():
	anim_tree.active = true
	death_menu.visible = false
	death_tutorial.visible = false
	tutorial = false
	get_limit()
	
func _physics_process(delta):
	
	#MOVEMENT
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
		
	#COLLISIONS
#	for i in get_slide_count():
#		var collision = get_slide_collision(i)
#		if (collision.collider.collision_layer) & 4:
#			var enemy: Node2D = collision.collider
#			var direction = (global_position - enemy.global_position).normalized()
#			velocity = direction * SPEED * 2
#			_health_loss()


#ANIMATIONS
	if is_on_floor():
		if heart_1.value == 0:
			velocity.x = 0
			velocity.y = 0
			playback.travel("death")
			
		elif abs(velocity.x) > 100:
			playback.travel("run")
		else: 
			playback.travel("idle")
			if Input.is_action_just_pressed("low_attack") and has_arrow:
				playback.travel("low_attack")
			if Input.is_action_just_pressed("high_attack") and has_arrow:
				playback.travel("high_attack")
			if Input.is_action_just_pressed("normal_attack") and has_arrow:
				playback.travel("normal_attack")
	else:
		if velocity.y < 0:
			playback.travel("jump_start")
		else:
			playback.travel("jump_fall")


#SKILLS
func _disparar():
	var arrow = flecha_alta.instance()
	arrow.init(Vector2(x_down*pivot.scale.x,y_down*pivot.scale.y), 0.06 ) # -> vector de velocidad que necesitemos
	get_parent().add_child(arrow)
	arrow.global_position = arrow_spawn.global_position
	has_arrow = false
	if pivot.scale.x == -1:
		arrow.rotation = PI

func _disparar_high():
	var arrow_alta = flecha_alta.instance()
	arrow_alta.init(Vector2(x_high*pivot.scale.x,y_high*pivot.scale.y), 0.3 ) # -> vector de velocidad que necesitemos
	get_parent().add_child(arrow_alta)
	arrow_alta.global_position = high_spawn.global_position
	has_arrow = false
	if pivot.scale.x == -1:
		arrow_alta.rotation = PI 


func _disparar_normal():
	var arrow_normal = flecha_alta.instance()
	arrow_normal.init(Vector2(x_normal*pivot.scale.x,y_normal*pivot.scale.y), 0.38 ) # -> vector de velocidad que necesitemos
	get_parent().add_child(arrow_normal)
	arrow_normal.global_position = normal_spawn.global_position
	has_arrow = false
	if pivot.scale.x == -1:
		arrow_normal.rotation = PI

#Health
func _health_loss():
	var heart_affected = heart_1
	for heart in hearts:
		if heart.value > 0:
			heart_affected = heart
	heart_affected.value -= 1


func dead():
	death_menu.highlight_button()
	
func arrow_fall():
	heart_3.value = 0
	heart_2.value = 0
	heart_1.value = 0




func get_limit():
	var upper_limit: Position2D = actual_level.get_node("Limits/limit_upper_left")
	var downer_limit: Position2D = actual_level.get_node("Limits/limit_downer_right")
	camera.limit_left = upper_limit.global_position.x
	camera.limit_top = upper_limit.global_position.y
	camera.limit_bottom = downer_limit.global_position.y
	camera.limit_right = downer_limit.global_position.x

func _death_menu_visible():
	if tutorial == true:
		print("1")
		death_tutorial.visible = true
		death_tutorial.highlight_button()
	else:
		print("2")
		death_menu.highlight_button()
		death_menu.visible = true
		

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "death":
		get_tree().paused = true
		_death_menu_visible()


func _on_Area2D_body_entered(body):
	if body.is_in_group("arrow"):
		has_arrow = true
		body.not_tutorial()
		body.queue_free() 


func _on_Area2D2_body_entered(body):
	var direction = (global_position - body.global_position).normalized()
	if heart_1.value > 0:
		velocity = direction * SPEED * 2
		velocity.y = clamp(velocity.y, -JUMP_SPEED, JUMP_SPEED)
		_health_loss()


func _on_Enemy_Collision_area_entered(area):
	var direction = (global_position - area.global_position).normalized()
	if heart_1.value > 0:
		velocity = direction * SPEED * 2
		velocity.y = clamp(velocity.y, -JUMP_SPEED, JUMP_SPEED)
		_health_loss()
