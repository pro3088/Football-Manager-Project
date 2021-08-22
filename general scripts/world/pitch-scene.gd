extends Node2D

var homepositiondictionary:Dictionary
var awaypositiondictionary:Dictionary

onready var centerpos = $"pitch-positions/centre-line".global_transform.origin

func _ready():
	homepositions()
	awaypositions()
	
	MatchPlay.homegoal = $Outfieldpositions/Homegoalpost.global_position
	MatchPlay.awaygoal = $Outfieldpositions/Awaygoalpost.global_position
	
	WorldSpace.centerpos = centerpos
	
	Playerbase.homePlayerPositions = homepositiondictionary
	Playerbase.awayPlayerPositions = awaypositiondictionary
	pass # Replace with function body.

func homepositions():
	homepositiondictionary["GK"] = $"home-match-pos/GK".global_transform.origin
	homepositiondictionary["CB"] = $"home-match-pos/CB".global_transform.origin
	homepositiondictionary["LB"] = $"home-match-pos/LB".global_transform.origin
	homepositiondictionary["RB"] = $"home-match-pos/RB".global_transform.origin
	homepositiondictionary["CMF"] = $"home-match-pos/CMF".global_transform.origin
	homepositiondictionary["CDM"] = $"home-match-pos/CDM".global_transform.origin
	homepositiondictionary["LMF"] = $"home-match-pos/LMF".global_transform.origin
	homepositiondictionary["RMF"] = $"home-match-pos/RMF".global_transform.origin
	homepositiondictionary["AMF"] = $"home-match-pos/AMF".global_transform.origin
	homepositiondictionary["CF"] = $"home-match-pos/CF".global_transform.origin
	homepositiondictionary["LWF"] = $"home-match-pos/LWF".global_transform.origin
	homepositiondictionary["RWF"] = $"home-match-pos/RWF".global_transform.origin
	homepositiondictionary["kickoff"] = $Outfieldpositions/Homekickoffpos.global_transform.origin

func awaypositions():
	awaypositiondictionary["GK"] = $"away-match-pos/GK".global_transform.origin
	awaypositiondictionary["CB"] = $"away-match-pos/CB".global_transform.origin
	awaypositiondictionary["LB"] = $"away-match-pos/LB".global_transform.origin
	awaypositiondictionary["RB"] = $"away-match-pos/RB".global_transform.origin
	awaypositiondictionary["CMF"] = $"away-match-pos/CMF".global_transform.origin
	awaypositiondictionary["CDM"] = $"away-match-pos/CDM".global_transform.origin
	awaypositiondictionary["LMF"] = $"away-match-pos/LMF".global_transform.origin
	awaypositiondictionary["RMF"] = $"away-match-pos/RMF".global_transform.origin
	awaypositiondictionary["AMF"] = $"away-match-pos/AMF".global_transform.origin
	awaypositiondictionary["CF"] = $"away-match-pos/CF".global_transform.origin
	awaypositiondictionary["LWF"] = $"away-match-pos/LWF".global_transform.origin
	awaypositiondictionary["RWF"] = $"away-match-pos/RWF".global_transform.origin
	awaypositiondictionary["kickoff"] = $Outfieldpositions/Awaykickoffpos.global_transform.origin














