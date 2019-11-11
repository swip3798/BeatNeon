extends ColorRect

var dragging: bool = false
var selector: Sprite

signal color_selected(color)

func _ready():
	selector = get_node("Selector")


func _on_HueRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			dragging = event.pressed
			if dragging:
				move_selector()
	elif event is InputEventMouseMotion and dragging:
		move_selector()
		
func move_selector():
	var pos: Vector2 = get_local_mouse_position()
	var size: Vector2 = get_rect().size
	pos = Vector2(min(pos.x, size.x), min(pos.y, size.y))
	pos = Vector2(max(pos.x, 0), max(pos.y, 0))
	selector.set_position(pos)
	emit_signal("color_selected", get_selected_color())
	

func get_selected_color():
	var rel_pos = selector.get_position() / get_rect().size
	return Color.from_hsv(rel_pos.x, 1.0 - rel_pos.y, 1.0)