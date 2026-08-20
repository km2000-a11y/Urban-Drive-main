extends Node

# ============================================================
#  FULL CLASS LIST (LOCAL — SELF-CONTAINED)
# ============================================================

var career_order := [
	"colossus",
	"street_tuners",
	"muscle_hustle",
	"v6_engines",
	"zenith_competition",
	"businessman_racers",
	"japanese_cup",
		"all_wheel_grip",
	"speedster_tournament",
	"kuro_cup",
	"schroder_cup",
		"german_cup",
		
		"eisenach_cup",
	"under_400_hp",
	"stingray_competition",
	"gentleman_racers",
	"kestrel_max",
		"sport_racing",   # ⭐ NEW CUP HERE ⭐

	"v12_engines",
	"supercars",
	"track_cars"
]
var cup_mode_progress := {}  # cup_id -> { "duel": bool, "radar": bool, "normal": bool, "elimination": bool }

func init_cup_progress(cup_id: String):
	if not cup_mode_progress.has(cup_id):
		cup_mode_progress[cup_id] = {
			"duel": false,
			"radar": false,
			"normal": false,
			"elimination": false
		}

func mark_mode_completed(cup_id: String, mode_id: String):
	init_cup_progress(cup_id)
	cup_mode_progress[cup_id][mode_id] = true
	save_career()

func is_cup_completed(cup_id: String) -> bool:
	init_cup_progress(cup_id)
	var m = cup_mode_progress[cup_id]
	return m["duel"] and m["radar"] and m["normal"] and m["elimination"]

var cup_rewards := {
	"colossus": "Kuro Zephyr",                         # Lexus IS250
	"street_tuners": "Brutus Viper",                   # 1967 Shelby GT500
	"muscle_hustle": "Schroder Atrix Q32",             # Audi TT Roadster
	"v6_engines": "Zenith Horizon",                    # Nissan 350Z
	"zenith_competition": "Mir Cars Transporter",      # Audi S8
	"businessman_racers": "Kuro Serenity",             # Lexus SC400
	"japanese_cup": "Strandberg Turbo",                # Volvo S60R
	"all_wheel_grip": "Kestrel Speedster",             # Morgan Aero 8
	"speedster_tournament": "Eisenach Goblin",         # BMW 1M Coupe
	"eisenach_cup": "Schroder Classique Sport",        # Audi S4 Cabriolet
	"schroder_cup": "Berkshire Blunt",                 # Jaguar XKR
	"under_400_hp": "Brutus Stingray",                 # Chevrolet Corvette C6
	"stingray_competition": "Berkshire V12-S",         # Aston Martin DB9
	"gentleman_racers": "Kestrel Touring",             # TVR Cerbera Speed Eight
	"kestrel_max": "Linetti Shepherd",                 # Lamborghini Gallardo
	"sport_racing": "Linetti Firestorm",               # Lamborghini Diablo Roadster
	"v12_engines": "Mir Cars Raptor",                  # Saleen S7
	"supercars": "Bartoli Track Cruiser",              # Maserati MC12
	"track_cars": "Mir Cars Athletic C70"              # Pagani Zonda
}

var class_lists: Dictionary = {
	"suv": [
		"Schroder Colosso",
		"Colossus Behemoth",
		"Mir Cars Nightwolf",
		"Colossus Titan Max"
	],

	"compact": [
		"Zenith Horizon",
		"Schroder Atrix Q32",
		"Straeda B32",
		"Kuro Zephyr",
		"Schroder D-20"
	],

	"muscle": [
		"Mir Cars Hutch",
		"Brutus Viper"
	],

	"urban": [
		"Berkshire Blunt",
		"Eisenach Prince",
		"Kestrel Speedster",
		"Eisenach Bengal",
				"Strandberg Turbo",
		"Kuro Serenity"
	],

	"sedans": [
		"Eisenach Suppressor",
		"Kuro Vault",
		"Mir Cars Transporter",
		"Kronstadt Fortress",
		"Kuro Persian"
	],

	"sport": [
				"Brutus Stingray",
		"Berkshire V12-S",
		"Eisenach Goblin",
		"Berkshire Tempest",
		"Schroder Classique Sport",
		"Kestrel Touring"
	],

	"sport_racing": [
		"Schroder Atrocity",
		"Linetti Shepherd",
		"Brutus Venom",
		"Kestrel Battleaxe"
	],

	"supercars": [
		"Linetti Terror",
		"Linetti Firestorm",
		"Kestrel Guillotine",
		"Mir Cars Raptor"
	],

	"track_cars": [
		"Mir Cars Athletic C70",
		"Bartoli Track Cruiser",
		"Brutus Thunderbolt"
	],

	"special": [
		"Bartoli Cruiser Interceptor"
	],
	"v6_engines":[
		"Schroder Atrix Q32",
		"Zenith Horizon"
	],
	"zenith_competition":[
		"Zenith Horizon"
	],
	"businessman_racers":[
		"Kuro Persian",
		"Kuro Vault",
		"Eisenach Suppressor",
		"Kronstadt Fortress",
		"Mir Cars Transporter"
	],
	"speedster_tournament":[
		"Kestrel Speedster"
	],
	"kuro_cup":[
		"Kuro Zephyr",
		"Kuro Vault",
		"Kuro Persian",
		"Kuro Serenity"
	],
	"all_wheel_grip":[
		"Strandberg Turbo",
		"Mir Cars Transporter",
		"Schroder Classique Sport",
		"Schroder Atrix Q32",
		"Straeda B32"
	],
	"eisenach_cup":[
		"Eisenach Suppressor",
		"Eisenach Bengal",
		"Eisenach Goblin",
		"Eisenach Prince"
	],
	"under_400_hp":[
		"Schroder Colosso",
		"Colossus Behemoth",
		"Mir Cars Nightwolf",
		"Eisenach Goblin",
		"Colossus Titan Max",
		"Kronstadt Fortress",
				"Zenith Horizon",
		"Schroder Atrix Q32",
		"Straeda B32",
		"Kuro Zephyr",
		"Schroder D-20",
				"Mir Cars Hutch",
		"Brutus Viper",
				"Eisenach Suppressor",
		"Kuro Vault",
		"Mir Cars Transporter",
				"Kronstadt Fortress",
		"Kronstadt Essence",
		"Eisenach Goblin",
		"Strandberg Turbo",
		"Kuro Persian",
				"Kestrel Touring",
							"Berkshire Blunt",
		"Eisenach Prince",
		"Kestrel Speedster",
		"Eisenach Bengal",
		"Kuro Serenity"	
	],
	"stingray_competition":[
		"Brutus Stingray"
	],
	"schroder_cup":[
		"Schroder D-20",
		"Schroder Atrix Q32",
		"Schroder Colosso",
		"Schroder Classique Sport",
		"Schroder Atrocity"
	],
	"gentleman_racers":[
		"Berkshire Blunt",
		"Berkshire V12-S",
		"Berkshire Tempest",
		"Kestrel Speedster"
	],
		"japanese_cup":[
		"Zenith Horizon",
		"Kuro Zephyr",
		"Kuro Persian",
		"Kuro Serenity",
		"Kuro Vault"
	],
		"german_cup":[
		"Schroder D-20",
		"Schroder Atrix Q32",
		"Schroder Colosso",
		"Schroder Classique Sport",
		"Schroder Atrocity",
				"Eisenach Suppressor",
		"Eisenach Goblin",
		"Eisenach Bengal",
				"Kronstadt Fortress",
		"Kronstadt Essence",
		"Eisenach Prince",
		"Straeda B32"
	],
		"kestrel_max":[
		"Kestrel Touring",
		"Kestrel Battleaxe",
		"Kestrel Guillotine"
	],
		"v12_engines":[
		"Kronstadt Fortress",
		"Berkshire V12-S",
		"Berkshire Tempest",
		"Linetti Firestorm",
		"Linetti Terror"
	]
}

# ============================================================
#  CHAMPIONSHIPS (ONLY THESE FOUR)
# ============================================================

var cups: Dictionary = {
	"colossus": {
		"eligible_classes": ["suv"],
		"eligible_cars": [
			"Schroder Colosso",
			"Colossus Behemoth",
			"Mir Cars Nightwolf",
			"Colossus Titan Max"
		]
	},

	"street_tuners": {
		"eligible_classes": ["compact"],
		"eligible_cars": [
			"Schroder Atrix Q32",
			"Schroder D-20",
			"Zenith Horizon",
			"Kuro Zephyr",
			"Straeda B32"
		]
	},

	"muscle_hustle": {
		"eligible_classes": ["muscle"],
		"eligible_cars": [
			"Brutus Viper",
			"Mir Cars Hutch"
		]
	},

"v6_engines": {
	"eligible_classes": ["v6_engines"],
	"eligible_cars": [
		"Zenith Horizon",
		"Schroder Atrix Q32"
	]
},
"zenith_competition":{
	"eligible_classes":["zenith_competition"],
	"eligible_cars":[
		"Zenith Horizon"
	]
},
"businessman_racers":{
	"eligible_classes":["businessman_racers"],
	"eligible_cars":[
		"Kuro Persian",
		"Kuro Vault",
		"Eisenach Suppressor",
		"Mir Cars Transporter"
	]
},
"speedster_tournament":{
	"eligible_classes":["speedster_tournament"],
	"eligible_cars":[
		"Kestrel Speedster"
	]
},
"kuro_cup":{
	"eligible_classes":["kuro_cup"],
	"eligible_cars":[
		"Kuro Zephyr",
		"Kuro Vault",
		"Kuro Persian",
		"Kuro Serenity"
	]
},
"all_wheel_grip":{
	"eligible_classes":["all_wheel_grip"],
	"eligible_cars":[
		"Strandberg Turbo",
		"Mir Cars Transporter",
		"Schroder Classique Sport",
		"Schroder Atrix Q32",
		"Straeda B32"
	]
},
"eisenach_cup":{
	"eligible_classes":["eisenach_cup"],
	"eligible_cars":[
		"Eisenach Suppressor",
		"Eisenach Bengal",
		"Eisenach Prince"
	]
},
"under_400_hp":{
	"eligible_classes":["under_400_hp"],
	"eligible_cars":[
				"Schroder Colosso",
		"Colossus Behemoth",
		"Mir Cars Nightwolf",
		"Colossus Titan Max",
				"Zenith Horizon",
						"Eisenach Goblin",
		"Schroder Atrix Q32",
		"Straeda B32",
		"Kuro Zephyr",
		"Schroder D-20",
				"Mir Cars Hutch",
		"Brutus Viper",
				"Eisenach Suppressor",
						"Kronstadt Fortress",
		"Kronstadt Essence",
		"Kuro Vault",
		"Mir Cars Transporter",
		"Strandberg Turbo",
		"Kuro Persian",
				"Kestrel Touring",
							"Berkshire Blunt",
		"Eisenach Prince",
		"Kestrel Speedster",
		"Eisenach Bengal",
		"Kuro Serenity"	
	]
},
"stingray_competition":{
	"eligible_classes":["stingray_competition"],
	"eligible_cars":[
		"Brutus Stingray"
	]
},
"schroder_cup":{
	"eligible_classes":["schroder_cup"],
	"eligible_cars":[
				"Schroder D-20",
		"Schroder Atrix Q32",
		"Schroder Colosso",
		"Schroder Classique Sport",
		"Schroder Atrocity"
	]
},
"gentleman_racers":{
	"eligible_classes":["gentleman_racers"],
	"eligible_cars":[
		"Berkshire Blunt",
		"Berkshire V12-S",
		"Berkshire Tempest",
		"Kestrel Speedster"
	]
},
"japanese_cup":{
	"eligible_classes":["japanese_cup"],
	"eligible_cars":[
			"Zenith Horizon",
		"Kuro Zephyr",
		"Kuro Persian",
		"Kuro Serenity",
		"Kuro Vault"
	]
},
"german_cup":{
	"eligible_classes":["german_cup"],
	"eligible_cars":[
				"Schroder D-20",
		"Schroder Atrix Q32",
		"Schroder Colosso",
		"Schroder Classique Sport",
		"Schroder Atrocity",
				"Eisenach Suppressor",
						"Kronstadt Fortress",
		"Kronstadt Essence",
		"Eisenach Goblin",
		"Eisenach Bengal",
		"Eisenach Prince",
		"Straeda B32"
	]
},
"kestrel_max":{
	"eligible_classes":["kestrel_max"],
	"eligible_cars":[
				"Kestrel Touring",
		"Kestrel Battleaxe",
		"Kestrel Guillotine"
	]
},
"v12_engines":{
	"eligible_classes":["v12_engines"],
	"eligible_cars":[
			"Kronstadt Fortress",
		"Berkshire V12-S",
		"Berkshire Tempest",
		"Linetti Firestorm",
		"Linetti Terror"
	]
},
"supercars":{
	"eligible_classes":["supercars"],
	"eligible_cars":[
				"Linetti Terror",
		"Linetti Firestorm",
		"Kestrel Guillotine",
		"Mir Cars Raptor"
	]
},
"track_cars":{
	"eligible_classes":["track_cars"],
	"eligible_cars":[
		"Mir Cars Athletic C70",
		"Bartoli Track Cruiser",
		"Brutus Thunderbolt"
	]
},
"sport_racing": {
	"eligible_classes": ["sport_racing"],
	"eligible_cars": [
		"Schroder Atrocity",
		"Linetti Shepherd",
		"Brutus Venom",
		"Kestrel Battleaxe"
	]
},

}

# ============================================================
#  MAIN FILTER FUNCTION (MENU + AI)
# ============================================================

func get_available_cars(cup_id: String) -> Array[String]:
	var cup: Dictionary = cups.get(cup_id, {})

	var eligible_classes: Array = cup.get("eligible_classes", [])
	var eligible_cars: Array = cup.get("eligible_cars", [])

	var result: Array[String] = []

	for class_id: String in eligible_classes:
		var cars_in_class: Array = class_lists.get(class_id, [])

		for car_name: String in cars_in_class:
			if eligible_cars.has(car_name):
				result.append(car_name)
				print("MATCH: ",car_name)

				

	print("ClubCups.gd USED")
	return result
var save_path := "user://career_save.json"
var unlocked_cups := {}  # cup_id -> bool

func load_career():
	if not FileAccess.file_exists(save_path):
		unlocked_cups = {}
		unlocked_cups[career_order[0]] = true
		save_career()
		return

	var file := FileAccess.open(save_path, FileAccess.READ)
	var text := file.get_as_text()
	file.close()

	var data = JSON.parse_string(text)
	if typeof(data) == TYPE_DICTIONARY:
		unlocked_cups = data.get("unlocked_cups", {})
		cup_mode_progress = data.get("cup_mode_progress", {})
	else:
		print("ERROR: Failed to load career save, resetting.")
		unlocked_cups = {}
		unlocked_cups[career_order[0]] = true
		save_career()


func save_career():
	var data = {
		"unlocked_cups": unlocked_cups,
		"cup_mode_progress": cup_mode_progress
	}

	var file := FileAccess.open(save_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()

func get_available_owned_cars(cup_id: String) -> Array[String]:
	var all: Array[String] = get_available_cars(cup_id)
	var owned: Array[String] = []

	for car_name: String in all:
		if Unlocks.is_unlocked(car_name):
			owned.append(car_name)

	return owned
func debug_auto_complete_cup(cup_id: String):
	# Mark all modes completed
	init_cup_progress(cup_id)
	cup_mode_progress[cup_id]["duel"] = true
	cup_mode_progress[cup_id]["radar"] = true
	cup_mode_progress[cup_id]["normal"] = true
	cup_mode_progress[cup_id]["elimination"] = true

	print("DEBUG: All modes completed for:", cup_id)

	# Unlock next cup
	var idx := career_order.find(cup_id)
	if idx != -1 and idx < career_order.size() - 1:
		var next :String= career_order[idx + 1]
		unlocked_cups[next] = true
		print("DEBUG: Next cup unlocked:", next)

	# Unlock reward car
	if cup_rewards.has(cup_id):
		var reward :String= cup_rewards[cup_id]
		Unlocks.unlock_car(reward)
		print("DEBUG: Reward car unlocked:", reward)

	save_career()
func complete_cup(cup_id: String):
	# Mark all modes complete
	init_cup_progress(cup_id)
	cup_mode_progress[cup_id]["duel"] = true
	cup_mode_progress[cup_id]["radar"] = true
	cup_mode_progress[cup_id]["normal"] = true
	cup_mode_progress[cup_id]["elimination"] = true

	# Unlock next cup
	var idx := career_order.find(cup_id)
	if idx != -1 and idx < career_order.size() - 1:
		var next :String= career_order[idx + 1]
		unlocked_cups[next] = true
		print("Unlocked next cup:", next)

	# Unlock reward car
	if cup_rewards.has(cup_id):
		var reward :String= cup_rewards[cup_id]
		Unlocks.unlock_car(reward)
		print("Reward unlocked:", reward)

	save_career()
