extends HTTPRequest

var hue_ip: String

signal bridge_found(ip)


func set_ip(ip: String):
	hue_ip = ip

func test_hue():
	request("http://" + hue_ip + "/api/newdeveloper")


func _on_TestHueConnection_request_completed(result, response_code, headers, body: PoolByteArray):
	
	var response: Dictionary = JSON.parse(body.get_string_from_utf8()).result
	
	
