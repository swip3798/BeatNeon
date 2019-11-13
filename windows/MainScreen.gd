extends Control

var os_window_dragged: bool = false
var fixed_mouse_position: Vector2

func _ready():
	if ProjectSettings.get_setting("display/window/per_pixel_transparency/allowed"):
		get_tree().get_root().set_transparent_background(true)

func _on_DragPoint_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		os_window_dragged = event.pressed
		fixed_mouse_position = get_global_mouse_position()
	elif event is InputEventMouseMotion and os_window_dragged:
		OS.window_position += get_global_mouse_position() - fixed_mouse_position
	pass


func _on_TabContainer_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		os_window_dragged = event.pressed
		fixed_mouse_position = get_global_mouse_position()
	elif event is InputEventMouseMotion and os_window_dragged:
		OS.window_position += get_global_mouse_position() - fixed_mouse_position
	pass


func _on_GrabContainer_gui_input(event):
	_on_TabContainer_gui_input(event)
