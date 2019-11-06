extends Control

export var spectrum_bars : int = 8
var hbox : HBoxContainer
const bar_res = preload("res://widgets/SpectrumBar.tscn")


func _ready():
	hbox = get_node("HBoxContainer")
	for i in range(spectrum_bars):
		var bar = bar_res.instance()
		hbox.add_child(bar)

func set_bars(values: Array):
	var idx: int = 0
	for i in values:
		hbox.get_child(idx).set_value(i)
		idx += 1