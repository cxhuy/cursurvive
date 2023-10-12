extends Label

var startTime


func _ready():
	startTime = Time.get_ticks_msec()


func _process(delta):
	var currentTimeSec = (Time.get_ticks_msec() - startTime) / 1000
	text = str(100 - currentTimeSec)
