extends Control

var time_since_last_change: float = 0
var color_send: bool = true
var lights_color: Color
var lights_brightness: float
export var wait_until_send: float = 0.25

func _ready():
	pass
	
func _process(delta):
	if not color_send:
		time_since_last_change += delta
		if time_since_last_change > wait_until_send:
			_send_change_of_color(lights_color, lights_brightness)
			color_send = true

func _send_change_of_color(color, brightness):
	print(color, " ", brightness)


func _on_ColorPicker_color_changed(color, brightness):
	lights_color = color
	lights_brightness = brightness
	color_send = false
	time_since_last_change = 0
	$HSplitContainer/VBoxContainer/HBoxContainer/ColorRect.color = lights_color
