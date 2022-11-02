extends Node2D

var homepositiondictionary:Dictionary
var awaypositiondictionary:Dictionary

onready var centerpos = $"pitch-positions/centre-line".global_transform.origin


func _ready():
	FieldVariables.Homekickoff = $Outfieldpositions/Homekickoffpos.global_transform.origin
	FieldVariables.Awaykickoff = $Outfieldpositions/Awaykickoffpos.global_transform.origin
	homepositions()
	awaypositions()
	
	var field_measure = $"field-size"
	var fieldExtents = field_measure.shape.extents
	var fieldPosition = field_measure.position
	
	WorldSpace.homegoalposition = $Outfieldpositions/Homegoalpost.global_position
	WorldSpace.awaygoalposition = $Outfieldpositions/Awaygoalpost.global_position
	
	MatchPlay.homegoal = $Outfieldpositions/Homegoalpost.global_position
	MatchPlay.awaygoal = $Outfieldpositions/Awaygoalpost.global_position
	
	WorldSpace.centerpos = centerpos
	
	Playerbase.homePlayerPositions = homepositiondictionary
	Playerbase.awayPlayerPositions = awaypositiondictionary
	
	grid(fieldExtents,fieldPosition)
	pass # Replace with function body.

#Get Home Player Positions and save to dictionary
func homepositions():
	FieldVariables.HomeGK = $"home-match-pos/GK".global_transform.origin
	FieldVariables.HomeCB = $"home-match-pos/CB".global_transform.origin
	FieldVariables.HomeLB = $"home-match-pos/LB".global_transform.origin
	FieldVariables.HomeRB = $"home-match-pos/RB".global_transform.origin
	FieldVariables.HomeCMF = $"home-match-pos/CMF".global_transform.origin
	FieldVariables.HomeCDM = $"home-match-pos/CDM".global_transform.origin
	FieldVariables.HomeLMF = $"home-match-pos/LMF".global_transform.origin
	FieldVariables.HomeRMF = $"home-match-pos/RMF".global_transform.origin
	FieldVariables.HomeAMF = $"home-match-pos/AMF".global_transform.origin
	FieldVariables.HomeCF = $"home-match-pos/CF".global_transform.origin
	FieldVariables.HomeLWF = $"home-match-pos/LWF".global_transform.origin
	FieldVariables.HomeRWF = $"home-match-pos/RWF".global_transform.origin

#Get Away Player Positions and save to dictionary
func awaypositions():
	FieldVariables.AwayGK = $"home-match-pos/GK".global_transform.origin
	FieldVariables.AwayCB = $"home-match-pos/CB".global_transform.origin
	FieldVariables.AwayLB = $"home-match-pos/LB".global_transform.origin
	FieldVariables.AwayRB = $"home-match-pos/RB".global_transform.origin
	FieldVariables.AwayCMF = $"home-match-pos/CMF".global_transform.origin
	FieldVariables.AwayCDM = $"home-match-pos/CDM".global_transform.origin
	FieldVariables.AwayLMF = $"home-match-pos/LMF".global_transform.origin
	FieldVariables.AwayRMF = $"home-match-pos/RMF".global_transform.origin
	FieldVariables.AwayAMF = $"home-match-pos/AMF".global_transform.origin
	FieldVariables.AwayCF = $"home-match-pos/CF".global_transform.origin
	FieldVariables.AwayLWF = $"home-match-pos/LWF".global_transform.origin
	FieldVariables.AwayRWF = $"home-match-pos/RWF".global_transform.origin

var hometeampossession = Team.hometeampossesion
var awayteampossession = Team.awayteampossesion

func _process(_delta):
	if hometeampossession:
		$"home-match-pos".global_position = Vector2(214,0)
		homepositions()
	else:
		$"home-match-pos".global_position = Vector2.ZERO
	
	if awayteampossession:
		$"away-match-pos".global_position = Vector2(-214,0)
		awaypositions()
	else:
		$"away-match-pos".global_position = Vector2.ZERO
#	var seeker = Astar.grid[5][11]
	var target = $Outfieldpositions/Awaygoalpost.global_position
	


#Initializing the grid positions and sending to Astar
func grid(fieldExtents,fieldPosition):
	$"Path Grid".grid(fieldExtents,fieldPosition,self.position)
	var grid = $"Path Grid".gridArray 
	var pathgrid = $"Path Grid".pathArray
	var run = false



