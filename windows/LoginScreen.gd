extends Control

func _ready():
	$HueBridge.search_bridge()


func _on_HueBridge_bridge_responded():
	$VBoxContainer/Button.disabled = false
	$VBoxContainer/Label.text = "Bridge found..."


func _on_Button_pressed():
	$HueBridge.login()


func _on_HueBridge_bridge_connected():
	get_tree().change_scene("res://windows/MainScreen.tscn")
