extends Node

enum TeamSide {
	HomeSide
	AwaySide
}

var teamPlayers = Database.clubTeam

var team

var playerdistance = 50

var topRolePlayers:Dictionary
var topEleven:Array

var fieldPlayers = Array()

var teamPositionsHome = Array()
var teamPositionsAway = Array()

var TeamNum = 11
var TotalPlayers = TeamNum * 2

var HomeTeam: Array
var AwayTeam: Array

func _ready():
	getBestRolePlayer()
	getEleven()

## create players to play according to team side and team color
func CreatePlayers(pitch):
	var Player_resource = load("res://player/player.tscn")
	var playerArray = Array()
	fieldPlayers.resize(TeamNum)
	for _x in range(fieldPlayers.size()):
		var Player = Player_resource.instance()
		playerArray.append(Player)
	
	
	match team :
		TeamSide.HomeSide:
			Home(pitch,playerArray)
		TeamSide.AwaySide:
			Away(pitch,playerArray)


# Create players for the Home Team
func Home(pitch,playerArray):
	for x in range(TeamNum):
		var append = playerArray[x]
		Playerbase.setHomePlayers(playerArray)
		Playerbase.setHomepositions(playerArray)
		Playerbase.setkickoff()
		pitch.add_child(append)

#Create players for the Away Team
func Away(pitch,playerArray):
	for x in range(TeamNum):
		var append = playerArray[x]
		Playerbase.setAwayPlayers(playerArray)
		Playerbase.setAwaypositions(playerArray)
		pitch.add_child(append)

func getBestRolePlayer():
	topRolePlayers = {
		"GK" : teamPlayers[0],
		"CB" : teamPlayers[0],
		"LB" : teamPlayers[0],
		"RB" : teamPlayers[0],
		"CDM" : teamPlayers[0],
		"CMF" : teamPlayers[0],
		"LMF" : teamPlayers[0],
		"RMF" : teamPlayers[0],
		"AMF" : teamPlayers[0],
		"LWF" : teamPlayers[0],
		"RWF" : teamPlayers[0],
		"SS" : teamPlayers[0],
		"CF" : teamPlayers[0]
	}
	for player in teamPlayers:
		if player.role == "GK":
			if topRolePlayers.get("GK").role != "GK":
				topRolePlayers["GK"] = player
			elif topRolePlayers.get("GK").rating < player.rating:
				topRolePlayers["GK"] = player
		if player.role == "CB":
			if topRolePlayers.get("CB").role != "CB":
				topRolePlayers["CB"] = player
			elif topRolePlayers.get("CB").rating < player.rating:
				topRolePlayers["CB"] = player
		if player.role == "LB":
			if topRolePlayers.get("LB").role != "LB":
				topRolePlayers["LB"] = player
			elif topRolePlayers.get("LB").rating < player.rating:
				topRolePlayers["LB"] = player
		if player.role == "RB":
			if topRolePlayers.get("RB").role != "RB":
				topRolePlayers["RB"] = player
			elif topRolePlayers.get("RB").rating < player.rating:
				topRolePlayers["RB"] = player
		if player.role == "CDM":
			if topRolePlayers.get("CDM").role != "CDM":
				topRolePlayers["CDM"] = player
			elif topRolePlayers.get("CDM").rating < player.rating:
				topRolePlayers["CDM"] = player
		if player.role == "CMF":
			if topRolePlayers.get("CMF").role != "CMF":
				topRolePlayers["CMF"] = player
			elif topRolePlayers.get("CMF").rating < player.rating:
				topRolePlayers["CMF"] = player
		if player.role == "LMF":
			if topRolePlayers.get("LMF").role != "LMF":
				topRolePlayers["LMF"] = player
			elif topRolePlayers.get("LMF").rating < player.rating:
				topRolePlayers["LMF"] = player
		if player.role == "RMF":
			if topRolePlayers.get("RMF").role != "RMF":
				topRolePlayers["RMF"] = player
			elif topRolePlayers.get("RMF").rating < player.rating:
				topRolePlayers["RMF"] = player
		if player.role == "AMF":
			if topRolePlayers.get("AMF").role != "AMF":
				topRolePlayers["AMF"] = player
			elif topRolePlayers.get("AMF").rating < player.rating:
				topRolePlayers["AMF"] = player
		if player.role == "LWF":
			if topRolePlayers.get("LWF").role != "LWF":
				topRolePlayers["LWF"] = player
			elif topRolePlayers.get("LWF").rating < player.rating:
				topRolePlayers["LWF"] = player
		if player.role == "RWF":
			if topRolePlayers.get("RWF").role != "RWF":
				topRolePlayers["RWF"] = player
			elif topRolePlayers.get("RWF").rating < player.rating:
				topRolePlayers["RWF"] = player
		if player.role == "RWF":
			if topRolePlayers.get("SS").role != "SS":
				topRolePlayers["SS"] = player
			elif topRolePlayers.get("SS").rating < player.rating:
				topRolePlayers["SS"] = player
		if player.role == "CF":
			if topRolePlayers.get("CF").role != "CF":
				topRolePlayers["CF"] = player
			elif topRolePlayers.get("CF").rating < player.rating:
				topRolePlayers["CF"] = player

func getEleven():
	Formation.setRoleNumber()
	
	var cb = Formation.cb
	var lb = Formation.lb
	var rb = Formation.rb
	var cdm = Formation.cdm
	var cmf = Formation.cmf
	var lmf = Formation.lmf
	var rmf = Formation.rmf
	var amf = Formation.amf
	var lwf = Formation.lwf
	var rwf = Formation.rwf
	var ss = Formation.ss
	var cf = Formation.cf
	
	topEleven.append(topRolePlayers.get("GK"))
	var total = cb + lb + rb + cdm + cmf + lmf + rmf + amf + lwf + rwf + ss + cf
	while total != 0 :
		for player in teamPlayers:
			var role = player.role
			if role == "CB" and cb > 0:
				topEleven.append(player)
				player.positionNo = cb
				cb -=1
			elif role == "LB" and lb > 0:
				topEleven.append(player)
				player.positionNo = lb
				lb -= 1
			elif role == "RB" and rb > 0:
				topEleven.append(player)
				player.positionNo = rb
				rb -= 1
			elif role == "CDM" and cdm > 0:
				topEleven.append(player)
				player.positionNo = cdm
				cdm -=1
			elif role == "CMF" and cmf > 0:
				topEleven.append(player)
				player.positionNo = cmf
				cmf -= 1
			elif role == "LMF" and lmf > 0:
				topEleven.append(player)
				player.positionNo = lmf
				lmf -= 1
			elif role == "RMF" and rmf > 0:
				topEleven.append(player)
				player.positionNo = rmf
				rmf -= 1
			elif role == "AMF" and amf > 0:
				topEleven.append(player)
				player.positionNo = amf
				amf -= 1
			elif role == "LWF" and lwf > 0:
				topEleven.append(player)
				player.positionNo = lwf
				lwf -= 1
			elif role == "RWF" and rwf > 0:
				topEleven.append(player)
				player.positionNo = rwf
				rwf -= 1
			elif role == "SS" and ss > 0:
				topEleven.append(player)
				player.positionNo = ss
				ss -= 1
			elif role == "CF" and cf > 0:
				topEleven.append(player)
				player.positionNo = cf
				cf -= 1
		total = cb + lb + rb + cdm + cmf + lmf + rmf + amf + lwf + rwf + ss + cf

func setPosition():
	for player in topEleven:
		var role = player.role
		if role == "GK":
			player.fieldPosition = FieldVariables.HomeGK
		elif role == "CB":
			if player.positionNo == 3:
				player.fieldPosition = FieldVariables.HomeCB
			elif player.positionNo == 2:
				player.fieldPosition = FieldVariables.HomeCB + Vector2(0,-playerdistance)
			else:
				player.fieldPosition = FieldVariables.HomeCB + Vector2(0,playerdistance)
		elif role == "LB":
			player.fieldPosition = FieldVariables.HomeLB
		elif role == "RB":
			player.fieldPosition = FieldVariables.HomeRB
		elif role == "CDM":
			if player.positionNo == 3:
				player.fieldPosition = FieldVariables.HomeCDM
			elif player.positionNo == 2:
				player.fieldPosition = FieldVariables.HomeCDM + Vector2(0,-playerdistance)
			else:
				player.fieldPosition = FieldVariables.HomeCDM + Vector2(0,playerdistance)
		elif role == "CMF":
			if player.positionNo == 3:
				player.fieldPosition = FieldVariables.HomeCMF
			elif player.positionNo == 2:
				player.fieldPosition = FieldVariables.HomeCMF + Vector2(0,-playerdistance)
			else:
				player.fieldPosition = FieldVariables.HomeCMF + Vector2(0,playerdistance)
		elif role == "LMF":
			player.fieldPosition = FieldVariables.HomeLMF
		elif role == "RMF":
			player.fieldPosition = FieldVariables.HomeRMF
		elif role == "AMF":
			if player.positionNo == 3:
				player.fieldPosition = FieldVariables.HomeAMF
			elif player.positionNo == 2:
				player.fieldPosition = FieldVariables.HomeAMF + Vector2(0,-playerdistance)
			else:
				player.fieldPosition = FieldVariables.HomeAMF + Vector2(0,playerdistance)
		elif role == "LWF":
			player.fieldPosition = FieldVariables.HomeLMF
		elif role == "RWF":
			player.fieldPosition = FieldVariables.HomeRMF
		elif role == "SS":
			if player.positionNo == 3:
				player.fieldPosition = FieldVariables.HomeSS
			elif player.positionNo == 2:
				player.fieldPosition = FieldVariables.HomeSS + Vector2(0,-playerdistance)
			else:
				player.fieldPosition = FieldVariables.HomeSS + Vector2(0,playerdistance)
		elif role == "CF":
			if player.positionNo == 3:
				player.fieldPosition = FieldVariables.HomeCF
			elif player.positionNo == 2:
				player.fieldPosition = FieldVariables.HomeCF + Vector2(0,-playerdistance)
			else:
				player.fieldPosition = FieldVariables.HomeCF + Vector2(0,playerdistance)












