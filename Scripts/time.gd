extends Label


func _process(delta):
	var currentTimeSec = Time.get_ticks_msec() / 1000
	text = str(100 - currentTimeSec)
