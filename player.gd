extends CharacterBody2D

signal laser(pos)

@export var speed := 500
var laser_ready: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(600,600)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# position += Vector2(1,0) * 50 * delta
	# $PlayerImage.rotation += 0.1 * delta
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_just_pressed("shoot") && laser_ready:
		laser.emit($LaserStartPos.global_position)
		laser_ready = false
		$LaserCooldown.start()
		$LaserSound.play()

func play_collision_sound():
	$DamageSound.play()

func _on_laser_cooldown_timeout():
	print('UPDATING LASER READY')
	laser_ready = true
