extends Control

var selected_color: Color = Color(1, 0, 0)
var brightness: float = 1.0

var slider

signal color_changed(color, brightness)

func _ready():
	slider = get_node("VBoxContainer/BrightnessSlider")

func _on_HueRect_color_selected(color):
	self.selected_color = color
	emit_signal("color_changed", selected_color, brightness)

func _on_BrightnessSlider_value_changed(value):
	brightness = value
	emit_signal("color_changed", selected_color, brightness)
