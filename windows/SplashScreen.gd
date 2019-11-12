extends Control

func _ready():
	OS.window_size = Vector2(1000,1000)
	get_tree().get_root().set_transparent_background(true)

func screen():
	var image = get_viewport().get_texture().get_data()
	image.flip_y()
	image.save_png("screen.png")

func _physics_process(delta):
	if Input.is_action_just_released("ui_accept"):
		screen()