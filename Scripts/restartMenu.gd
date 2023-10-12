extends Control


func populateMenu():
	$Label.text = "You survived for " + "%2.2f" % (Game.survivedTime / 1000.0) + " seconds\n" + \
	"and killed a total of " + str(Game.totalKillCount) + " enemies"
	Game.totalKillCount = 0


func populateMenuClear():
	$Label.text = "Congratulations! You survived for 100 seconds!\n" + \
	"and killed a total of " + str(Game.totalKillCount) + " enemies"
	Game.totalKillCount = 0


func restartGame():
	$".".hide
	get_tree().reload_current_scene()
	get_tree().paused = false
