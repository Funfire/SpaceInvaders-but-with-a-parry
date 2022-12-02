extends Label

var running = true
var start_time = OS.get_unix_time()

onready var label = $"."

func _process(delta):
	if running:
		getTime()


func getTime():
	var time_now = OS.get_unix_time()
	var elasped = time_now - start_time
	var seconds = elasped % 60
	var hours = elasped / 3600
	var minutes = (elasped - (3600*hours)) / 60
	var elapsed_time = "%02d:%02d:%02d" % [hours ,minutes, seconds]
	label.text = elapsed_time
