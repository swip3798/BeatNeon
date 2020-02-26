extends Node

signal user_id_gathered(user_id)
var ip_address
var port

func _ready():
	ip_address = get_parent().ip_address
	port = get_parent().port

func get_user_id():
	var user_id = Persistent.get_value("user_id")
	if user_id != null:
		_check_user_id(user_id)
	else:
		register_new_user()
		
func _check_user_id(user_id: String):
	$CheckUser.request(URLBuilder.build_bridge_url(ip_address, port, "/api/" + user_id))

func register_new_user():
	$RegisterNewUser.request(URLBuilder.build_bridge_url(ip_address, port, "/api"), PoolStringArray(), true, HTTPClient.METHOD_POST, '{"devicetype": "beatneon#window_pc"}')


func _on_CheckUser_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var response = parse_json(body.get_string_from_utf8())
		if body.get_string_from_utf8()[0] == "[":
			var error_type = response[0].get("error", {}).get("type")
			if error_type == "1":
				register_new_user()
		else:
			emit_signal("user_id_gathered", Persistent.get_value("user_id"))


func _on_RegisterNewUser_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var response: Array = parse_json(body.get_string_from_utf8())
		var user_id = response[0].get("success", {}).get("username")
		var error_link_button_not_pressed = response[0].get("error", {}).get("type")
		if user_id == null:
			if error_link_button_not_pressed == "101":
				yield(get_tree().create_timer(0.5), "timeout")
				print("Waited half a second")
				register_new_user()
		else:
			Persistent.set_value("user_id", user_id)
			emit_signal("user_id_gathered", user_id)
