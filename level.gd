extends Node2D

#1 load scene
var meteor_scene: PackedScene = load("res://meteor.tscn")
var laser_scene: PackedScene = load("res://laser.tscn")

var health: int = 3

func _ready():
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	
	get_tree().call_group('ui','set_health', health)
	
	for star in $Stars.get_children():
		var random_pos = Vector2(rng.randi_range(0, size.x), rng.randi_range(0, size.y))
		var random_scale = rng.randf_range(1,2)
		
		star.position = random_pos
		star.scale = Vector2(random_scale, random_scale)
		star.speed_scale = rng.randf_range(0.6, 1.4)
	
func _on_meteor_timer_timeout():
	#2  instance
	var meteor = meteor_scene.instantiate()
	#3 attach node to scene tree
	$Meteors.add_child(meteor)
	meteor.connect('collision', _on_meteor_collision)
	
func _on_meteor_collision():
	health -= 1
	print('meteor collision')
	get_tree().call_group('ui','set_health', health)
	if health == 0:
		get_tree().change_scene_to_file("res://game_over.tscn")

func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Lasers.add_child(laser)

