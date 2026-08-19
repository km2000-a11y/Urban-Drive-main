extends Node

var active_cup: String = ""
var championship_mode: bool = false
var completed_cups: Array[String] = []
var cup_progress := {}  # cup_id -> {normal=true, duel=true, elimination=true, radar=true}


func reset():
	active_cup = ""
	championship_mode = false
func save_progress():
	var data = {
		"completed_cups": completed_cups,
		"active_cup": active_cup,
		"championship_mode": championship_mode
	}
	var file = FileAccess.open("user://championship.save", FileAccess.WRITE)
	file.store_var(data)
	file.close()
	print("Championship saved.")
	

func load_progress():
	if not FileAccess.file_exists("user://championship.save"):
		print("No championship save found.")
		return

	var file = FileAccess.open("user://championship.save", FileAccess.READ)
	var data = file.get_var()
	file.close()

	if data.has("completed_cups"):
		completed_cups = data["completed_cups"]

	print("Championship loaded:", completed_cups)
func start_cup(cup_id: String):
	active_cup = cup_id
	championship_mode = true

	if not cup_progress.has(cup_id):
		cup_progress[cup_id] = {
			"normal": false,
			"duel": false,
			"elimination": false,
			"radar": false
		}
