extends Node

var homePlayerPositions: Dictionary
var awayPlayerPositions: Dictionary

var homekickoff: bool
var awaykickoff: bool

var Kickoffplayer

var array:Array

var playerposition : Vector2 

var playerdistance = 50

var CB: int = 0
var CDM: int = 0
var CMF: int = 0
var AMF: int = 0
var SS: int = 0
var CF: int = 0

var hplayersCBArray:Array
var hplayersCDMArray:Array
var hplayersCMFArray:Array
var hplayersAMFArray:Array
var hplayersSSArray:Array
var hplayersCFArray:Array

var aplayersCBArray:Array
var aplayersCDMArray:Array
var aplayersCMFArray:Array
var aplayersAMFArray:Array
var aplayersSSArray:Array
var aplayersCFArray:Array

var awayCB: int = 0
var awayCDM: int = 0
var awayCMF: int = 0
var awayAMF: int = 0
var awaySS: int = 0
var awayCF: int = 0

var hCBposition
var hCDMposition
var aCBposition
var aCDMposition

func setHomePlayers(playerarray):
	var no = 0
	var playerdata = Database.playerstats
	for player in playerarray:
		player.stats = playerdata[no]
		no += 1

func setAwayPlayers(playerarray):
	var number = Team.TeamNum
	var no = 0
	var playerdata
	for player in playerarray:
		player.stats = Database.playerstats[no]
		print(player.stats.name)
		no += 1


func setAwaypositions(playerarray):
	getawayplayernum(playerarray)
	for player in playerarray:
		if player.stats.role == "GK":
			player.homeposition = awayPlayerPositions["GK"]
			player.global_position = player.homeposition
		if player.stats.role == "CB":
			if awayCB ==3:
				player.homeposition = awayPlayerPositions["CB"]
				player.global_position = player.homeposition
			elif awayCB == 2:
				if player == aplayersCBArray[0]:
					player.homeposition = awayPlayerPositions["CB"] + Vector2(0,-playerdistance)
					aplayersCBArray[0].global_position = player.homeposition
				if player == aplayersCBArray[1]:
					player.homeposition = awayPlayerPositions["CB"] + Vector2(0,playerdistance)
					aplayersCBArray[1].global_position = player.homeposition
			elif awayCB == 1:
				player.homeposition = awayPlayerPositions["CB"]
				aplayersCBArray[0].global_position = player.homeposition
		if player.stats.role == "RB":
			player.homeposition = awayPlayerPositions["RB"]
			player.global_position = player.homeposition
		if player.stats.role == "LB":
			player.homeposition = awayPlayerPositions["LB"]
			player.global_position = player.homeposition
		if player.stats.role == "LMF":
			player.homeposition = awayPlayerPositions["LMF"]
			player.global_position = player.homeposition
		if player.stats.role == "RMF":
			player.homeposition = awayPlayerPositions["RMF"]
			player.global_position = player.homeposition
		if player.stats.role == "RWF":
			player.homeposition = awayPlayerPositions["RWF"]
			player.global_position = player.homeposition
		if player.stats.role == "LWF":
			player.homeposition = awayPlayerPositions["LWF"]
			player.global_position = player.homeposition
		if player.stats.role == "CDM":
			if awayCDM == 3:
				player.homeposition = awayPlayerPositions["CDM"]
				player.global_position = player.homeposition
			elif awayCDM == 2:
				if player == aplayersCDMArray[0]:
					player.homeposition = awayPlayerPositions["CDM"] + Vector2(0,-playerdistance)
					aplayersCDMArray[0].global_position = player.homeposition
				elif player == aplayersCDMArray[1]:
					player.homeposition = awayPlayerPositions["CDM"] + Vector2(0,playerdistance)
					aplayersCDMArray[1].global_position = player.homeposition
			elif awayCDM == 1:
				player.homeposition = awayPlayerPositions["CDM"]
				aplayersCDMArray[0].global_position = player.homeposition
		if player.stats.role == "CMF":
			if awayCMF ==3:
				player.homeposition = awayPlayerPositions["CMF"]
				player.global_position = player.homeposition
			elif awayCMF == 2:
				if player == aplayersCMFArray[0]:
					player.homeposition = awayPlayerPositions["CMF"] + Vector2(0,-playerdistance)
					aplayersCMFArray[0].global_position = player.homeposition
				elif player == aplayersCMFArray[1]:
					player.homeposition = awayPlayerPositions["CMF"] + Vector2(0,playerdistance)
					aplayersCMFArray[1].global_position = player.homeposition
			elif awayCMF == 1:
				player.homeposition = awayPlayerPositions["CMF"]
				aplayersCFArray[0].global_position = player.homeposition
		if player.stats.role == "AMF":
			if awayAMF ==3:
				player.homeposition = awayPlayerPositions["AMF"]
				aplayersAMFArray[0].global_position = player.homeposition
			elif awayAMF == 2:
				if player == aplayersAMFArray[0]:
					player.homeposition = awayPlayerPositions["AMF"] + Vector2(0,-playerdistance)
					aplayersAMFArray[0].global_position = player.homeposition
				elif player == aplayersAMFArray[1]:
					player.homeposition = awayPlayerPositions["AMF"] + Vector2(0,playerdistance)
					aplayersAMFArray[1].global_position = player.homeposition
			elif awayAMF == 1:
				player.homeposition = awayPlayerPositions["AMF"]
				aplayersAMFArray[0].global_position = player.homeposition
		if player.stats.role == "CF":
			if awayCF ==3:
				player.homeposition = awayPlayerPositions["CF"]
				player.global_position = player.homeposition
			elif awayCF == 2:
				if player == aplayersCFArray[0]:
					player.homeposition = awayPlayerPositions["CF"] + Vector2(0,-playerdistance)
					aplayersCFArray[0].global_position = player.homeposition
				elif player == aplayersCFArray[1]:
					player.homeposition = awayPlayerPositions["CF"] + Vector2(0,playerdistance)
					aplayersCFArray[1].global_position = player.homeposition
			elif awayCF == 1:
				player.homeposition = awayPlayerPositions["CF"]
				aplayersCFArray[0].global_position = player.homeposition
		if player.stats.role == "SS":
			if awayCF ==3:
				player.homeposition = awayPlayerPositions["CF"] + Vector2(-playerdistance,0)
				player.global_position = player.homeposition
			elif awaySS == 2:
				if player == aplayersSSArray[0]:
					player.homeposition = awayPlayerPositions["CF"] + Vector2(0,-playerdistance)
					aplayersSSArray[0].global_position = player.homeposition
				elif player == aplayersSSArray[1]:
					player.homeposition = awayPlayerPositions["CF"] + Vector2(0,playerdistance)
					aplayersSSArray[1].global_position = player.homeposition
			elif awaySS == 1:
				player.homeposition = awayPlayerPositions["CF"]
				aplayersSSArray[0].global_position = player.homeposition


func setHomepositions(playerarray):
	gethomeplayernum(playerarray)
	for player in playerarray:
		if player.stats.role == "GK":
			player.homeposition = homePlayerPositions["GK"]
			player.global_position = player.homeposition
		if player.stats.role == "CB":
			if CB ==3:
				player.homeposition = homePlayerPositions["CB"]
				player.global_position = player.home.position
			elif CB == 2:
				if player == hplayersCBArray[0]:
					player.homeposition = homePlayerPositions["CB"] + Vector2(0,-playerdistance)
					hplayersCBArray[0].global_position = player.homeposition
				elif player == hplayersCBArray[1]:
					player.homeposition = homePlayerPositions["CB"] + Vector2(0,playerdistance)
					hplayersCBArray[1].global_position = player.homeposition
			elif CB == 1:
				player.homeposition = homePlayerPositions["CB"]
				hplayersCBArray[0].global_position = player.homeposition
		if player.stats.role == "RB":
			player.homeposition= homePlayerPositions["RB"]
			player.global_position = player.homeposition
		if player.stats.role == "LB":
			player.homeposition = homePlayerPositions["LB"]
			player.global_position = player.homeposition
		if player.stats.role == "LMF":
			player.homeposition = homePlayerPositions["LMF"]
			player.global_position = player.homeposition
		if player.stats.role == "RMF":
			player.homeposition = homePlayerPositions["RMF"]
			player.global_position = player.homeposition
		if player.stats.role == "RWF":
			player.homeposition = homePlayerPositions["RWF"]
			player.global_position = player.homeposition
		if player.stats.role == "LWF":
			player.homeposition = homePlayerPositions["LWF"]
			player.global_position = player.homeposition
		if player.stats.role == "CDM":
			if CDM == 3:
				player.homeposition = homePlayerPositions["CDM"]
				player.global_position = player.homeposition
			elif CDM == 2:
				if player == hplayersCDMArray[0]:
					player.homeposition = homePlayerPositions["CDM"] + Vector2(0,-playerdistance)
					hplayersCDMArray[0].global_position = player.homeposition
				elif player == hplayersCDMArray[1]:
					player.homeposition = homePlayerPositions["CDM"] + Vector2(0,playerdistance)
					hplayersCDMArray[1].global_position = player.homeposition
			elif CDM == 1:
				player.homeposition = homePlayerPositions["CDM"]
				hplayersCDMArray[0].global_position = player.homeposition
				pass
		if player.stats.role == "CMF":
			if CMF ==3:
				player.homeposition = homePlayerPositions["CMF"]
				player.global_position = player.homeposition
			elif CMF == 2:
				if player == hplayersCMFArray[0]:
					player.homeposition = homePlayerPositions["CMF"] + Vector2(0,-playerdistance)
					hplayersCMFArray[0].global_position = player.homeposition
				elif player == hplayersCMFArray[1]:
					player.homeposition = homePlayerPositions["CMF"] + Vector2(0,playerdistance)
					hplayersCMFArray[1].global_position = player.homeposition
					#print(player,player.stats.role,"1",hplayersCMFArray[1].global_position)
			elif CMF == 1:
				player.homeposition = homePlayerPositions["CMF"]
				hplayersCMFArray[0].global_position = player.homeposition
		if player.stats.role == "AMF":
			if AMF ==3:
				player.homeposition = homePlayerPositions["AMF"]
				player.global_position = player.homeposition
			elif AMF == 2:
				if player == hplayersAMFArray[0]:
					player.homeposition = homePlayerPositions["AMF"] + Vector2(0,-playerdistance)
					hplayersAMFArray[0].global_position = player.homeposition
				elif player == hplayersAMFArray[1]:
					player.homeposition = homePlayerPositions["AMF"] + Vector2(0,playerdistance)
					hplayersAMFArray[1].global_position = player.homeposition
			elif AMF == 1:
				player.homeposition = homePlayerPositions["AMF"]
				hplayersAMFArray[0].global_position = player.homeposition
		if player.stats.role == "CF":
			if CF ==3:
				player.homeposition = homePlayerPositions["CF"]
				player.global_position = player.homeposition
			elif CF == 2:
				if player == hplayersCFArray[0]:
					player.homeposition = homePlayerPositions["CF"] + Vector2(0,-playerdistance)
					hplayersCFArray[0].global_position = player.homeposition
				if player == hplayersCFArray[1]:
					player.homeposition = homePlayerPositions["CF"] + Vector2(0,playerdistance)
					hplayersCFArray[1].global_position = player.homeposition
			elif CF == 1:
				player.homeposition = homePlayerPositions["CF"]
				hplayersCFArray[0].global_position = player.homeposition
				
		if player.stats.role == "SS":
			if SS ==3:
				player.homeposition = homePlayerPositions["CF"] + Vector2(-playerdistance,0)
				player.global_position = player.homeposition
			elif SS == 2:
				if player == hplayersSSArray[0]:
					player.homeposition = homePlayerPositions["CF"] + Vector2(0,-playerdistance)
					hplayersSSArray[0].global_position = player.homeposition
				if player == hplayersSSArray[1]:
					player.homeposition = homePlayerPositions["CF"] + Vector2(0,playerdistance)
					hplayersSSArray[1].global_position = player.homeposition
			elif SS == 1:
				player.homeposition = homePlayerPositions["CF"]
				hplayersSSArray[0].global_position = player.homeposition
		pass

func gethomeplayernum(playerarray):
	for player in playerarray:
		if player.stats.role == "CB":
			if CB == 0:
				hplayersCBArray.append(player)
				CB += 1
			elif CB == 1  and player != hplayersCBArray[0]:
				hplayersCBArray.append(player)
				CB += 1
		elif player.stats.role == "CDM":
			if CDM == 0:
				hplayersCDMArray.append(player)
				CDM += 1
			elif CDM == 1 and player != hplayersCDMArray[0]:
				hplayersCDMArray.append(player)
				CDM += 1
		elif player.stats.role == "CMF":
			if CMF == 0:
				hplayersCMFArray.append(player)
				CMF += 1
			elif CMF == 1 and player != hplayersCMFArray[0]:
				hplayersCMFArray.append(player)
				CMF += 1
		elif player.stats.role == "AMF":
			if AMF == 0:
				hplayersAMFArray.append(player)
				AMF += 1
			elif AMF == 1 and player != hplayersAMFArray[0]:
				hplayersAMFArray.append(player)
				AMF += 1
		elif player.stats.role == "CF":
			if CF == 0:
				hplayersCFArray.append(player)
				CF += 1
			elif CF == 1 and player != hplayersCFArray[0]:
				hplayersCFArray.append(player)
				CF += 1
		elif player.stats.role == "SS":
			if CF == 0:
				hplayersSSArray.append(player)
				CF += 1
			elif CF == 1 and player != hplayersSSArray[0]:
				hplayersSSArray.append(player)
				CF += 1

func getawayplayernum(playerarray):
	for player in playerarray:
		if player.stats.role == "CB":
			if awayCB == 0:
				awayCB += 1
				aplayersCBArray.append(player)
			elif awayCB == 1 and player != aplayersCBArray[0]:
				awayCB += 1
				aplayersCBArray.append(player)
		elif player.stats.role == "CDM":
			if awayCDM == 0:
				awayCDM += 1
				aplayersCDMArray.append(player)
			elif awayCDM == 1 and player != aplayersCDMArray[0]:
				awayCDM += 1
				aplayersCDMArray.append(player)
		elif player.stats.role == "CMF":
			if awayCMF == 0:
				awayCMF += 1
				aplayersCMFArray.append(player)
			elif awayCMF == 1 and player != aplayersCMFArray[0]:
				awayCMF += 1
				aplayersCMFArray.append(player)
		elif player.stats.role == "AMF":
			if awayAMF == 0:
				awayAMF += 1
				aplayersAMFArray.append(player)
			elif awayAMF == 1 and player != aplayersAMFArray[0]:
				awayAMF += 1
				aplayersAMFArray.append(player)
		elif player.stats.role == "CF":
			if awayCF == 0:
				awayCF += 1
				aplayersCFArray.append(player)
			elif awayCF == 1 and player != aplayersCFArray[0]:
				awayCF += 1
				aplayersCFArray.append(player)
		elif player.stats.role == "SS":
			if awayCF == 0:
				awayCF += 1
				aplayersSSArray.append(player)
			elif awayCF == 1 and player != aplayersSSArray[0]:
				awayCF += 1
				aplayersSSArray.append(player)



func setkickoff():
	var training = WorldSpace.training
	if !MatchPlay.matchstart and hplayersCFArray.size() > 0 and !training:
		hplayersCFArray[0].global_position = homePlayerPositions["kickoff"]
		Kickoffplayer = hplayersCFArray[0]
	elif !MatchPlay.matchstart and hplayersSSArray.size() > 0 and !training:
		hplayersSSArray[0].global_position = homePlayerPositions["kickoff"]
		Kickoffplayer = hplayersSSArray[0]
		pass
	pass
	
func restartplay():
	var training = WorldSpace.training
	if MatchPlay.restarthomeplay and hplayersCFArray.size() > 0 and !training:
		hplayersCFArray[0].global_position = homePlayerPositions["kickoff"]
		Kickoffplayer = hplayersCFArray[0]
		MatchPlay.restarthomeplay = false
	elif MatchPlay.restarthomeplay and hplayersSSArray.size() > 0 and !training:
		hplayersSSArray[0].global_position = homePlayerPositions["kickoff"]
		Kickoffplayer = hplayersSSArray[0]
		MatchPlay.restarthomeplay = false
	if MatchPlay.restartawayplay and aplayersCFArray.size() > 0 and !training:
		aplayersCFArray[0].global_position = awayPlayerPositions["kickoff"]
		Kickoffplayer = aplayersCFArray[0]
		MatchPlay.restartawayplay = false
	elif MatchPlay.restartawayplay and aplayersSSArray.size() > 0 and !training:
		hplayersCFArray[0].global_position = awayPlayerPositions["kickoff"]
		Kickoffplayer = aplayersSSArray[0]
		MatchPlay.restartawayplay = false
	pass






