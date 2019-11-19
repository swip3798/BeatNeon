extends HTTPRequest

const broker_url = "https://discovery.meethue.com/"
#const broker_url = "https://httpbin.org/get"

const example_body = """[{
  "id":"001788fffe100491",
  "internalipaddress":"192.168.2.23",
  "macaddress":"00:17:88:10:04:91",
  "name":"Philips Hue"
},
{
  "id":"001788fffe09a168",
  "internalipaddress":"192.168.88.252"
},
{
  "id":"001788fffe16c18f",
  "internalipaddress":"192.168.2.20",
  "macaddress":"00:17:88:16:c1:8f",
  "name":"Philips Hue"
}]"""

func _ready():
	search_for_bridges()

func search_for_bridges():
	request(broker_url)


func _on_HueBridgeSearch_request_completed(result, response_code, headers, body: PoolByteArray):
#	var response_string: String = body.get_string_from_utf8()
	var response_string: String = example_body
	var response: Dictionary = JSON.parse(response_string).result
	print(response)
