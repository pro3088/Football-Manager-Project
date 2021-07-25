extends Node

const sqlite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DataStore/fm_db"
 #Called when the node enters the scene tree for the first time.


func getplayers(id:int):
	db = sqlite.new()
	db.path = db_name
	db.open_db()
	var dict: Dictionary
	db.query("SELECT Players.name, Players.age, Players.attack, Players.defence, Players.pass, Players.curve, Players.physique, Players.form, Role.name as role, Country.name as country FROM Players LEFT JOIN Role on Players.roleid = role.id JOIN Country on Players.countryid = Country.id WHERE Players.id = "+ str(id))
	for x in db.query_result:
		dict = x
	return dict
	
	
	
	
