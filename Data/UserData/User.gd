extends Node

var path = "user://GameData/Save_game.json"

var passFile="fwegfuywe7r632r7312ghdjfvjhfesedwfcdewqyhfewjf"
var userName = "ROTIMI"
var clubName = "ROTEX-FC"

var details:Dictionary = {
	"username" : userName,
	"clubname" : clubName
}

func _ready():
	var file = File.new()
	print_debug(" Getting User Details")
	
	if file.file_exists(path):
		print("File Path exists")
		loadGame()
	else:
		saveUser()


func saveUser():
	var file = File.new()
	print("Saving User Details")
	file.open_encrypted_with_pass (path, File.WRITE,passFile)
	file.store_string(to_json(details))
	file.close()


func loadGame():
	var file = File.new()
	
	file.open_encrypted_with_pass (path, File.READ,passFile)
	var data = parse_json(file.get_as_text())
	file.close()
	
	print_debug("Getting User Details from file")
	if typeof(data) == TYPE_DICTIONARY:
		details = data
	else:
		printerr("Corrupted data!")
