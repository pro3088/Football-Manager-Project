extends Node

const sqlite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DataStore/fm_db"
# Called when the node enters the scene tree for the first time.
func _ready():
	db = sqlite.new()
	db.path = db_name
	db.foreign_keys = true
	getplayers(1)
	pass

func commitDatatoDb():
	db.open_db()
	var tableName = "Player"
	var dict : Dictionary = Dictionary()
	
	
func readfromdb():
	db.open_db()
	
	
func getplayers(id:int):
	db = sqlite.new()
	db.open_db()
	var selectarray: Array = db.select_rows("Player",["*"])
	print (selectarray)
	pass
	
	
	
	
