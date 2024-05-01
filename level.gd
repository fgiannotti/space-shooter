extends Node2D

#1 load scene
var meteor_scene: PackedScene = load("res://meteor.tscn")


func _on_meteor_timer_timeout():
	print('meteor timer timeout')
	#2  instance
	var meteor = meteor_scene.instantiate()
	
	#3 attach node to scene tree
	$Meteors.add_child(meteor)
