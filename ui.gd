extends CanvasLayer

static var image = load("res://assets/PNG/UI/playerLife1_red.png")

func set_health(health):
	# remove all children
	for child in $LifesMargin/LifesOrg.get_children():
		child.queue_free()
	# create new children amount set by health
	for i in health:
		var health_icon = TextureRect.new()
		health_icon.texture = image
		$LifesMargin/LifesOrg.add_child(health_icon)
		health_icon.stretch_mode = TextureRect.STRETCH_KEEP

func refresh_score():
	$CounterMargin/KillCounter.text = str(Global.score)
