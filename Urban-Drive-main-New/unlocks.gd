extends Node

var save_path := "user://unlocked_cars.json"

# car_name -> bool
var unlocked: Dictionary = {}

func _ready():
	load_unlocks()

# ============================================================
#  SAVE / LOAD
# ============================================================

func save_unlocks():
	var file := FileAccess.open(save_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(unlocked))
	file.close()

func load_unlocks():
	if not FileAccess.file_exists(save_path):
		# Starter car only
		unlocked = {
			"Colossus Behemoth": true
		}
		save_unlocks()
		return

	var file := FileAccess.open(save_path, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file.close()

	if typeof(data) == TYPE_DICTIONARY:
		unlocked = data
	else:
		# Auto‑repair corrupted save
		unlocked = { "Colossus Behemoth": true }
		save_unlocks()

# ============================================================
#  UNLOCK FUNCTIONS
# ============================================================

func unlock_car(car_name: String):
	if car_name == "" or car_name == null:
		return

	unlocked[car_name] = true
	save_unlocks()

func lock_car(car_name: String):
	if unlocked.has(car_name):
		unlocked[car_name] = false
		save_unlocks()

func is_unlocked(car_name: String) -> bool:
	return unlocked.get(car_name, false)

func get_unlocked_list() -> Array[String]:
	var list: Array[String] = []
	for car_name in unlocked.keys():
		if unlocked[car_name]:
			list.append(car_name)
	return list

# ============================================================
#  OPTIONAL: ENSURE ALL CARS EXIST IN SAVE
#  (Prevents missing keys when new cars are added)
# ============================================================

func ensure_car_exists(car_name: String):
	if not unlocked.has(car_name):
		unlocked[car_name] = false
		save_unlocks()
