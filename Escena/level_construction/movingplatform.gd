extends Node2D

export var idle_duration: float = 1.0

export var move_to: Vector2
export var cell_size: Vector2
export var speed: float = 3.0

var follow: Vector2 = Vector2.ZERO

onready var platform = $platform
onready var tween = $move_tween

func _ready() -> void:
	_init_tween()

func _init_tween() -> void:
	move_to = move_to * cell_size
	var duration = move_to.length() / speed
	
	tween.interpolate_property(self, "follow", Vector2.ZERO, 
			move_to, duration, Tween.TRANS_LINEAR,
			Tween.EASE_IN_OUT, idle_duration)
	
	tween.interpolate_property(self, "follow", move_to, Vector2.ZERO, 
			duration, Tween.TRANS_LINEAR, 
			Tween.EASE_IN_OUT, duration + idle_duration * 2)
	
	tween.start()
	
func _physics_process(_delta):
	platform.position = follow	
	
