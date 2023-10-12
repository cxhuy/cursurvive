extends Label

var startTime
var currentTimeSec

func _ready():
	startTime = Time.get_ticks_msec()


func _process(delta):
	Game.survivedTime = (Time.get_ticks_msec() - startTime)	
	currentTimeSec = (Time.get_ticks_msec() - startTime) / 1000
	self.text = str(100 - currentTimeSec)
