extends Area2D

var rng := RandomNumberGenerator.new()

signal collision
signal meteor_destroyed
# direction
var dir_x = rng.randf_range(-1,1)
var dir_y = rng.randf_range(0.5,1)
var speed = rng.randi_range(200, 500)
var rotation_deg = rng.randi_range(40,100)

func _ready():
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0,width)
	var random_y = rng.randi_range(-150,-500)
	# Starting position
	position = Vector2(random_x, random_y)
	$Sprite2D.texture = load("res://assets/PNG/Meteors/" + str(rng.randi_range(1,5))+ ".png")
	
func _process(delta):
	position += Vector2(dir_x,dir_y) * speed * delta
	rotation_degrees += rotation_deg * delta
	
func _on_body_entered(_body):
	collision.emit()


func _on_area_entered(area):
	Global.score += 1
	get_tree().call_group('ui','refresh_score')
	area.queue_free()
	meteor_destroyed.emit()
	queue_free()
