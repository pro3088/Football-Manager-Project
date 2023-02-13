extends Node2D

var Ball

var Awaygoal = 0
var Homegoal = 0

var Astar:AstarNode

var ball = preload("res://MatchVariables/Scenes/Ball.tscn").instance()

func _ready():
	self.add_child(ball)
	ball.global_position = $"Control/pitch-scene".centerPos
	
	var homeFieldpositions = $"Control/pitch-scene".homepositions()
	var awayFieldpositions = $"Control/pitch-scene".awaypositions()
	var squad = Database.getTeam("TOMI")
	squad = TeamData.createOppData(squad)
	var homeTeam = Team($HomeTeam, homeFieldpositions, TeamData.squadPlayers, TeamCreator.matchPlace.HOME)
	var awayTeam = Team($AwayTeam, awayFieldpositions, squad, TeamCreator.matchPlace.AWAY)
	
	var grid = Grid.new($"Control/pitch-scene".gridPos.get("START"), $"Control/pitch-scene".gridPos.get("END"))
	grid.createGrid()
	grid.setAstarGrid()
	Astar = AstarNode.new(grid.getAstarGrid())
	
	var allPlayers:Array
	allPlayers.append_array(homeTeam)
	allPlayers.append_array(awayTeam)
	print(allPlayers.size())
	
	Astar.allPlayers = allPlayers
	
	
	

func Team(holder:Node2D, fieldpositions, squad, matchplace):
	var squadPlayers = TeamCreator.new().createTeam(fieldpositions, squad, matchplace)
	for player in squadPlayers:
		holder.add_child(player)
	return squadPlayers

func _process(delta):
	Astar.normalizeNode()
#	var path = Astar.path(Vector2(71,49), Vector2(692,49))
#	print(path[3])











