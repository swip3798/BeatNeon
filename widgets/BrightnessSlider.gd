extends Control

export var min_value: float = 0
export var max_value: float = 100
export var step: float = 1
export var page: float = 0
export var value: float = 0

signal value_changed(value)

var slider: HSlider

func _ready():
	slider = get_node("HSlider")
	slider.min_value = min_value
	slider.max_value = max_value
	slider.step = step
	slider.page = page
	slider.value = value
	

func _on_HSlider_value_changed(value):
	self.value = value
	emit_signal("value_changed", value)