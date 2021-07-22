extends Node

const sqlite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DataStore/fm_db"
 #Called when the node enters the scene tree for the first time.
func _ready():
	getplayers(1)
	pass

func getplayers(id:int):
	db = sqlite.new()
	db.path = db_name
	db.open_db()
	var dict: Dictionary
	return dict
	
	
	
	
