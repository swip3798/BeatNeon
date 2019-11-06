extends HTTPRequest

signal on_api_answer(data)
export var BASE_IP: String
export var PATH: String

func _ready():
	pass


func _on_HueAPIBaseClass_request_completed(result, response_code, headers, body):
	pass 
