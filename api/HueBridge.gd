extends Node

export var ip_address: String = "localhost"
export var port: int = 80

func _ready():
	$RegisterUser.get_user_id()

