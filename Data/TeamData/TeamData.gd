extends Node

var ratingLinkedList:Dictionary
var ratingArray:Dictionary

var squadPlayers:Array

var teamPlayers = Database.clubTeam


func _ready():
	sortTopEleven()
	setSquadPlayers()

func sortTopEleven():
	
	print("initializing rating list with LinkedList")
	ratingLinkedList = {
		"GK" : LinkedList.new(),
		"CB" : LinkedList.new(),
		"LB" : LinkedList.new(),
		"RB" : LinkedList.new(),
		"CDM" : LinkedList.new(),
		"CMF" : LinkedList.new(),
		"LMF" : LinkedList.new(),
		"RMF" : LinkedList.new(),
		"AMF" : LinkedList.new(),
		"LWF" : LinkedList.new(),
		"RWF" : LinkedList.new(),
		"SS" : LinkedList.new(),
		"CF" : LinkedList.new()
	}
	print("initializing rating array with Array")
	ratingArray = {
		"GK" : Array(),
		"CB" : Array(),
		"LB" : Array(),
		"RB" : Array(),
		"CDM" : Array(),
		"CMF" : Array(),
		"LMF" : Array(),
		"RMF" : Array(),
		"AMF" : Array(),
		"LWF" : Array(),
		"RWF" : Array(),
		"SS" : Array(),
		"CF" : Array()
	}
	
	setLinkedListRoles()
	setArrayRoles()

func setSquadPlayers():
	print_debug("initializing formation data")
	var formation = formation.new()
	
	print("adding players to squad i.e top eleven")
	#adding GK to squad
	squadPlayers.append(ratingArray.get("GK")[0])
	
	#adding other players
	print_debug("getting roles from player stats class")
	var roles:Array = stats.roleSpecs.values().pop_front()
	for val in roles:
		var role:String = val
		role = role.to_upper()
		var num = formation.getRoleNumber(role)
		print("adding players in " + role + " to squad ")
		print("adding " + num + " players from " + role)
		if num > 1:
			var no = 0
			while (no + 1) < formation.role:
				print_debug("getting player stats")
				var player:stats = ratingArray.get(role)[no]
				var specs = player.positionSpecs
				if no == 0:
					player.position = specs.LEFT
					print("player position is left")
				elif no ==1:
					player.position = specs.RIGHT
					print("player position is right")
				else:
					player.position = specs.DEFAULT
					print("player takes a central/default position")
				squadPlayers.append(player)
				no += 1
		elif formation.getRoleNumber(role) == 0:
			pass
		else:
			print_debug("getting player stats")
			var player:stats = ratingArray.get(role)[0]
			player.position = player.positionspecs.DEFAULT
			print("player takes a central/default position")
			squadPlayers.append(player)
	
func setLinkedListRoles():
	print("setting players to LinkedList")
	for player in teamPlayers:
		print_debug("getting roles from player stats class")
		var roles:Array = stats.roleSpecs.values()
		for val in roles:
			var role:String = val
			role = role.to_upper()
			print("adding " + player + " to " + role + " linkedlist")
			if player.role == role:
				ratingLinkedList[role] = setLinkedList(ratingLinkedList.get(role),player)
				print("player added")

func setLinkedList(list:LinkedList, player):
	var current = list.head
	if current == null:
		print("list is null")
		list.addFirst(player)
		print("player added")
	else:
		print_debug("adding data to existing list")
		print("running through " + list.size() + "elements")
		while current.data.rating > player.rating or current.next != null:
			print("moving to next element")
			current = current.next
		if current.data.rating > player.rating and current.next == null:
			print_debug("adding player to end of linkedlist")
			list.addLast(player)
		elif current.data.rating < player.rating:
			print_debug(" inserting player into list")
			list.insertBefore(current,player)
		print("player added")
	return list 

func setArrayRoles():
	print_debug("getting roles from player stats class")
	var roles:Array = stats.roleSpecs.values()
	for val in roles:
		var role:String = val
		role = role.to_upper()
		print_debug("converting linkedlist to array")
		ratingArray[role] = ratingLinkedList.get(role).converttoArray()
		print("list converted")





