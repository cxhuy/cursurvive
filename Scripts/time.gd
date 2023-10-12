extends Label

var startTime
var currentTimeSec


func _ready():
	startTime = Time.get_ticks_msec()


func _process(delta):
	Game.survivedTime = (Time.get_ticks_msec() - startTime)	
	currentTimeSec = (Time.get_ticks_msec() - startTime) / 1000
	self.text = str(100 - currentTimeSec)
	if 100 - currentTimeSec <= 0:
		get_tree().paused = true
		get_node("../RestartMenu").populateMenuClear()
		get_node("../RestartMenu").show()
