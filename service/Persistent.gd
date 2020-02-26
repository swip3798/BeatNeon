extends Node

var global_dict: Dictionary = {}
const persistent_path = "user://persistent.dat"

func _ready():
	_load_json()

func set_value(name: String, value):
	global_dict[name] = value
	_save_json()
	
func get_value(name: String):
	return global_dict.get(name, null)
	
func _save_json():
	var json: String = JSON.print(global_dict)
	_save_file(json)

func _load_json():
	var json: String = _load_file()
	global_dict = JSON.parse(json).result

func _load_file():
	var file: File = File.new()
	if not file.file_exists(persistent_path):
		_save_json()
	file.open(persistent_path, File.READ)
	var content:String = file.get_as_text()
	file.close()
	return content

func _save_file(content: String):
	var file: File = File.new()
	file.open(persistent_path, File.WRITE)
	file.store_string(content)
	file.close()
