extends Node2D



onready var archer = $Archer
onready var archer_lives = archer.hearts


# Called when the node enters the scene tree for the first time.
func _ready():
	archer.heart_3.value = Game.player_lives[2]
	archer.heart_2.value = Game.player_lives[1]
	archer.heart_1.value = Game.player_lives[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
