extends Node

func build_bridge_url(ip_address: String, port: int, path: String):
	return "http://" + ip_address + ":" + str(port) + path

