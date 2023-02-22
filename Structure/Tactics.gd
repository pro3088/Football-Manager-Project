extends Node

class_name Tactics

enum attackstyle{ #style of attacking play
	counter
	possession
}

enum positioning{ # do players fill the spaces
	maintain
	flexible
}

enum marking{
	manToMan
	conservative
}

var atk
var teamPos
var teamMark

var pitchWidth:float = 0.1 #width of the center line of the pitch #horizontal
var defenseWidth:float = 0.1 #width of the defense (of each player) between counter 

var touchline:float = 0.1

var defenseLine:float = 0.1 #length from the center line of the pitch #vertical

var pressurebias: float = 0.3
var defensebias: float = 0.1

var supportRange:float = 0.1  #distance between players

var avgTeamAtkBias:float = 0.5

var supportNo:int = 3 #number of players that support

var path = "res://general scripts/User/save_tactics.json"

var passFile="fwegfuywe7r632r7312ghdjfvjhfesedwfcdewqyhfewjf"

#var details:Dictionary = {
#	"username" : userName,
#	"clubname" : clubName
#}
#
#func _ready():
#	var file = File.new()
#	print_debug(" Getting User Tactics")
#
#	if file.file_exists(path):
#		print("File Path exists")
#		loadGame()
#	else:
#		saveUser()
#
#
#func saveUser():
#	var file = File.new()
#	print("Saving User Details")
#	file.open_encrypted_with_pass (path, File.WRITE,passFile)
#	file.store_string(to_json(details))
#	file.close()
#
#
#func loadGame():
#	var file = File.new()
#
#	file.open_encrypted_with_pass (path, File.READ,passFile)
#	var data = parse_json(file.get_as_text())
#	file.close()
#
#	print_debug("Getting User Details from file")
#	if typeof(data) == TYPE_DICTIONARY:
#		details = data
#	else:
#		printerr("Corrupted data!")








