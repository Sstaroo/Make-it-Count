extends Node2D

var preloadedEnemies := [preload("res://Escena/enemies/stones.tscn")]

onready var spawnTimer = $SpawnTimer 

var nextspawn := 3

func _ready():
	randomize()
	spawnTimer.start(nextspawn)
	pass # Replace with function body.





func _on_Timer_timeout():
	
	var enemyPreload = preloadedEnemies[randi() % preloadedEnemies.size()]
	var enemy: Enemy = enemyPreload.instance() 
	enemy.position = Vector2(0,position.y)
	spawnTimer.start(nextspawn)
