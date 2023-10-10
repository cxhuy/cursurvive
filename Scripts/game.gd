extends Node2D


func _input(event):
	if Input.is_action_pressed("Restart"):
		get_tree().reload_current_scene()
	elif Input.is_action_pressed("Pause"):
		get_tree().paused = true
