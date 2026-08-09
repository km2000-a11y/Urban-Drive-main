extends Node

# ============================================================
#  FULL CLASS LIST (LOCAL — SELF-CONTAINED)
# ============================================================


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
		"Kuro Serenity"
	],

	"sedans": [
		"Eisenach Suppressor",
		"Kuro Vault",
		"Mir Cars Transporter",
		"Strandberg Turbo",
		"Kuro Persian"
	],

	"sport": [
				"Brutus Stingray",
		"Berkshire V12-S",
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
	
}
}

# ============================================================
#  MAIN FILTER FUNCTION (MENU + AI)
# ============================================================

func get_available_cars(cup_id: String) -> Array[String]:
	var cup: Dictionary = cups[cup_id]

	var eligible_classes: Array = cup["eligible_classes"]
	var eligible_cars: Array = cup["eligible_cars"]

	var result: Array[String] = []

	for class_id: String in eligible_classes:
		var cars_in_class: Array = class_lists.get(class_id, [])

		for car_name: String in cars_in_class:
			if eligible_cars.has(car_name):
				result.append(car_name)
				print("MATCH: ",car_name)

				

	print("ClubCups.gd USED")
	return result
