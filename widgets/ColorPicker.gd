extends Control

var selected_color: Color = Color(1, 0, 0)
var brightness: float = 1.0

func _on_HueRect_color_selected(color):
	self.selected_color = color
