extends Control

func _ready():
	$GameOverMargin/VBoxContainer/YourScore.text += str(Global.score)

func _input(event):
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_file("res://level.tscn")
