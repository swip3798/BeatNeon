extends Control

var time: float = 0

func _ready():
	pass

func _process(delta):
	time += delta
	var bar_values = []
	for i in range(12):
		bar_values.append(sin(time + i*0.1))
	get_node("AudioSpectrumView").set_bars(bar_values)