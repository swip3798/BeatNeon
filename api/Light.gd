extends Node

var light_name: String
var id: int
var brightness: int
var hue: int
var saturation: int

var up_to_date: bool = false

var ip_address

func _get_data():
	if not up_to_date:
		_load_light_data()

func _load_light_data():
	$GetLightState.request(URLBuilder.build_bridge_url(
