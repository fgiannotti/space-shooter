extends Area2D

var laser_speed = 50

func _ready():
	var tween = create_tween()
	tween.tween_property($Sprite2D, 'scale', Vector2(1,1), 0.2).from(Vector2(0,0))

func _process(delta):
	position += Vector2(0,-10) * laser_speed * delta
