tool
extends EditorScript

func _run():
	var scene:KinematicBody2D = get_scene()
	
	#COLLISION SHAPE
	var new_coll = CollisionShape2D.new()
	scene.add_child(new_coll)
	new_coll.owner = scene
	scene.collision_mask = 1
	scene.collision_layer = 4
	
	#CAPSULE 2D
	var shape = CapsuleShape2D.new()
	new_coll.shape = shape
	
	#PIVOT
	var pivote = Node2D.new()
	scene.add_child(pivote)
	pivote.owner = scene
	pivote.name = "pivot"
	
	#ANIMATED SPRITE
	var anim_sprite = AnimatedSprite.new()
	pivote.add_child(anim_sprite)
	anim_sprite.owner = scene
	
	#FRAMES
	var frames = SpriteFrames.new()
	anim_sprite.frames = frames
