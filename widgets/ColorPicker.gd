extends Control

var picker: ColorPicker
var rect: ColorRect

func _ready():
	picker = get_node("Picker")
	rect = get_node("ColorRect")

func _process(delta):
	if picker.raw_mode:
		picker.raw_mode = false


func _on_Picker_color_changed(color):
	rect.color = color
