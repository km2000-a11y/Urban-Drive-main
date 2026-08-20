extends CanvasLayer

var cup_buttons = {}

func _ready():
	# Play menu music
	MusicManager.play_menu_music()

	# Load career progress
	ClubCups.load_progress()

	# Build dictionary AFTER nodes exist
	cup_buttons = {
		"colossus": $Control/ScrollContainer/VBoxContainer/Colossus,
		"street_tuners": $Control/ScrollContainer/VBoxContainer/StreetTuners,
		"muscle_hustle": $Control/ScrollContainer/VBoxContainer/MuscleHustle,
		"v6_engines": $Control/ScrollContainer/VBoxContainer/V6Engines,
		"zenith_competition": $Control/ScrollContainer/VBoxContainer/ZenithCompetition,
		"businessman_racers": $Control/ScrollContainer/VBoxContainer/BusinessmanRacers,
		"speedster_tournament": $Control/ScrollContainer/VBoxContainer/SpeedsterTournament,
		"all_wheel_grip": $Control/ScrollContainer/VBoxContainer/AllWheelGrip,
		"eisenach_cup": $Control/ScrollContainer/VBoxContainer/EisenachCup,
		"under_400_hp": $Control/ScrollContainer/VBoxContainer/Under400HP,
		"stingray_competition": $Control/ScrollContainer/VBoxContainer/StingrayCompetition,
		"schroder_cup": $Control/ScrollContainer/VBoxContainer/SchroderCup,
		"gentleman_racers": $Control/ScrollContainer/VBoxContainer/GentlemanRacers,
		"japanese_cup": $Control/ScrollContainer/VBoxContainer/JapaneseCup,
		"kestrel_max": $Control/ScrollContainer/VBoxContainer/KestrelMax,
		"v12_engines": $Control/ScrollContainer/VBoxContainer/V12Engines,
		"supercars": $Control/ScrollContainer/VBoxContainer/Supercars,
		"track_cars": $Control/ScrollContainer/VBoxContainer/TrackCars,
		"sport_racing": $Control/ScrollContainer/VBoxContainer/SportRacing
	}

	# Now update buttons safely
	_update_buttons()


func _process(delta):
	# Debug shortcut: press M to auto-complete current cup
	if Input.is_action_just_pressed("debug_complete_championship"):
		if ChampionshipState.active_cup != "":
			ClubCups.complete_cup(ChampionshipState.active_cup)
			_update_buttons()
func _update_buttons():
	for cup_id in cup_buttons.keys():
		var btn = cup_buttons[cup_id]
		if btn == null:
			continue  # skip if node not found

		btn.disabled = !_is_unlocked(cup_id)

		# Mark completed visually
		if ClubCups.progress.has("completed_cups") and ClubCups.progress["completed_cups"].has(cup_id):
			if not btn.text.ends_with("✔"):
				btn.text += " ✔"



func _is_unlocked(cup_id: String) -> bool:
	var idx = ClubCups.championship_order.find(cup_id)
	if idx == -1:
		return false
	if idx == 0:
		return true # first cup always unlocked
	var prev_cup = ClubCups.championship_order[idx - 1]

	if ClubCups.progress.has("completed_cups"):
		return ClubCups.progress["completed_cups"].has(prev_cup)
	return false

# ============================================================
# Existing Button Handlers (unchanged)
# ============================================================

func _on_colossus_pressed() -> void:
	GameMode.game_mode = "Club Cups"
	ChampionshipState.active_cup = "colossus"
	ChampionshipState.championship_mode = true

	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_street_tuners_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="street_tuners"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_muscle_hustle_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="muscle_hustle"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_v_6_engines_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="v6_engines"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_back_btn_pressed():
	ChampionshipState.reset()
	GameMode.game_mode = ""
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_zenith_competition_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="zenith_competition"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_businessman_racers_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="businessman_racers"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_speedster_tournament_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="speedster_tournament"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_kuro_cup_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="kuro_cup"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_all_wheel_grip_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="all_wheel_grip"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_eisenach_cup_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="eisenach_cup"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_under_400hp_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="under_400_hp"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_stingray_competition_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="stingray_competition"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_schroder_cup_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="schroder_cup"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_gentleman_racers_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="gentleman_racers"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_japanese_cup_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="japanese_cup"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")



func _on_german_cup_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="german_cup"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_kestrel_max_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="kestrel_max"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_v_12_engines_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="v12_engines"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_supercars_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="supercars"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_track_cars_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="track_cars"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")


func _on_sport_racing_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="sport_racing"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")
