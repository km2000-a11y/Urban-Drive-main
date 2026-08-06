extends Node

var cups := {
	"colossus": {
		"eligible_classes": ["suv"],
		"eligible_cars": [
			"Schroder Colosso",
			"Colossus Behemoth",
			"Mir Cars Nightwolf",
			"Colossus Titan Max"
		]
	}
}

func get_available_cars(cup_id: String) -> Array:
	var cup: Dictionary = cups[cup_id]
	var eligible_classes: Array = cup["eligible_classes"]
	var eligible_cars: Array = cup["eligible_cars"]

	var result: Array = []

	for class_id in eligible_classes:
		var cars_in_class: Array = Cars.class_lists.get(class_id, [])

		for car_name in cars_in_class:
			if eligible_cars.has(car_name):
				result.append(car_name)

	return result
