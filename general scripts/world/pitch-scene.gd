extends Node2D

var homepositiondictionary:Dictionary
var awaypositiondictionary:Dictionary

func _ready():
	homepositions()
	awaypositions()
	pass # Replace with function body.

func homepositions():
	homepositiondictionary["GK"] = $"home-match-pos/GK".global_position
	homepositiondictionary["CB"] = $"home-match-pos/CB".global_position
	homepositiondictionary["LB"] = $"home-match-pos/LB".global_position
	homepositiondictionary["RB"] = $"home-match-pos/RB".global_position
	homepositiondictionary["CMF"] = $"home-match-pos/CMF".global_position
	homepositiondictionary["CDM"] = $"home-match-pos/CDM".global_position
	homepositiondictionary["LMF"] = $"home-match-pos/LMF".global_position
	homepositiondictionary["RMF"] = $"home-match-pos/RMF".global_position
	homepositiondictionary["AMF"] = $"home-match-pos/AMF".global_position
	homepositiondictionary["CF"] = $"home-match-pos/CF".global_position
	homepositiondictionary["LWF"] = $"home-match-pos/LWF".global_position
	homepositiondictionary["RWF"] = $"home-match-pos/RWF".global_position

func awaypositions():
	awaypositiondictionary["GK"] = $"home-match-pos/GK".global_position
	awaypositiondictionary["CB"] = $"home-match-pos/CB".global_position
	awaypositiondictionary["LB"] = $"home-match-pos/LB".global_position
	awaypositiondictionary["RB"] = $"home-match-pos/RB".global_position
	awaypositiondictionary["CMF"] = $"home-match-pos/CMF".global_position
	awaypositiondictionary["CDM"] = $"home-match-pos/CDM".global_position
	awaypositiondictionary["LMF"] = $"home-match-pos/LMF".global_position
	awaypositiondictionary["RMF"] = $"home-match-pos/RMF".global_position
	awaypositiondictionary["AMF"] = $"home-match-pos/AMF".global_position
	awaypositiondictionary["CF"] = $"home-match-pos/CF".global_position
	awaypositiondictionary["LWF"] = $"home-match-pos/LWF".global_position
	awaypositiondictionary["RWF"] = $"home-match-pos/RWF".global_position
