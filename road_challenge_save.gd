extends Node

var unlocked := {
	"suv": true,
	"muscle": true,
	"compact": true,
	"sedans": false,
	"urban": false,
	"sport": false,
	"sport_racing": false,
	"supercars": false,
	"track_cars": false
}

var progress := {
	"suv": 0,
	"muscle": 0,
	"compact": 0,
	"sedans": 0,
	"urban": 0,
	"sport": 0,
	"sport_racing": 0,
	"supercars": 0,
	"track_cars": 0
}

func unlock_next_group(group_id: String):
	var order := [
		"suv",
		"muscle",
		"compact",
		"sedans",
		"urban",
		"sport",
		"sport_racing",
		"supercars",
		"track_cars"
	]

	var idx := order.find(group_id)
	if idx >= 0 and idx < order.size() - 1:
		unlocked[order[idx + 1]] = true
