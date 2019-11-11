extends Control

var time_since_last_change: float = 0
var color_send: bool = true
var lights_color: Color
export var wait_until_send: float = 0.25


func _process(delta):
	if not color_send:
		time_since_last_change += delta
		if time_since_last_change > wait_until_send:
			_send_change_of_color(lights_color)
			color_send = true

func _on_ColorPickerButton_color_changed(color):
	lights_color = color
	color_send = false
	time_since_last_change = 0
	
func _send_change_of_color(color):
	print(color)
