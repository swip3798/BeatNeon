extends VBoxContainer

export var value: float = 1.0
var col: ColorRect
var trans: ColorRect

func _ready():
	col = get_node("Color")
	trans = get_node("Transparent")
	set_value(value)


func set_value(value: float):
	trans.size_flags_stretch_ratio = 1.0 - value
	col.size_flags_stretch_ratio = value