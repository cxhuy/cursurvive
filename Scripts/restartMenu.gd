extends Control


func restartGame():
	$".".hide
	get_tree().reload_current_scene()
	get_tree().paused = false
