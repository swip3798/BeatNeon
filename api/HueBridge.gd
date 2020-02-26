extends Node

export var emulator_mode: bool = false
export var ip_address: String = "localhost"
export var port: int = 80
var user_id: String

signal bridge_connected
signal bridge_responded

func login():
	$RegisterUser.get_user_id()
	
func init_after_login():
	user_id = Persistent.get_value("user_id")
	ip_address = Persistent.get_value("hue_ip")
	

func _on_RegisterUser_user_id_gathered(user_id):
	self.user_id = user_id
	print(user_id)
	emit_signal("bridge_connected")

func search_bridge():
	if not emulator_mode:
		ip_address = _get_bridge_ip()
	_check_bridge_ip()
	
func _get_bridge_ip():
	return null
	
func _check_bridge_ip():
	$TestIP.request(URLBuilder.build_bridge_url(ip_address, port, "/api/newdeveloper"))
	
func _on_TestIP_request_completed(result, response_code, headers, body):
	if response_code == 200:
		Persistent.set_value("hue_ip", ip_address)
		emit_signal("bridge_responded")
