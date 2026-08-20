extends CanvasLayer

@onready var money_label=$Control/MoneyLabel
func _ready():
	Cars.load_money()
	_update_money_label()
	ClubCups.load_career() 
	MusicManager.play_menu_music()
	_update_lock_states()
	set_process_input(true)
	

func _input(event):
	if event.is_action_pressed("debug_complete_cup"):

			if ChampionshipState.active_cup == "":
				ChampionshipState.active_cup = ClubCups.career_order[0]

			var cup := ChampionshipState.active_cup

			# Complete all modes
			ClubCups.debug_auto_complete_cup(cup)

			# Unlock next cup
			var idx := ClubCups.career_order.find(cup)
			if idx != -1 and idx < ClubCups.career_order.size() - 1:
				var next :String= ClubCups.career_order[idx + 1]
				ClubCups.unlocked_cups[next] = true
				print("DEBUG: Unlocked next cup:", next)

			# Save
			ClubCups.save_career()

			print("DEBUG: Completed cup:", cup)

			# Refresh UI
			_update_lock_states()




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
	GameMode.game_mode = "Club Cups"
	ChampionshipState.active_cup = "sport_racing"
	ChampionshipState.championship_mode = true
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")

func _update_lock_states():
	for cup_id in ClubCups.career_order:
		var btn := _get_button_for_cup(cup_id)
		if btn == null:
			continue

		var unlocked :bool= ClubCups.unlocked_cups.get(cup_id, false)

		btn.disabled = not unlocked
		if unlocked:
			btn.modulate = Color(1, 1, 1)
		else:
			btn.modulate = Color(0.5, 0.5, 0.5)

func _get_button_for_cup(cup_id: String) -> Button:
	match cup_id:
	
		"street_tuners":
			return $Control/ScrollContainer/VBoxContainer/StreetTuners
		"muscle_hustle":
			return $Control/ScrollContainer/VBoxContainer/MuscleHustle
		"v6_engines":
			return $Control/ScrollContainer/VBoxContainer/V6Engines
		"zenith_competition":
			return $Control/ScrollContainer/VBoxContainer/ZenithCompetition
		"businessman_racers":
			return $Control/ScrollContainer/VBoxContainer/BusinessmanRacers
		"speedster_tournament":
			return $Control/ScrollContainer/VBoxContainer/SpeedsterTournament
		"kuro_cup":
			return $Control/ScrollContainer/VBoxContainer/KuroCup
		"all_wheel_grip":
			return $Control/ScrollContainer/VBoxContainer/AllWheelGrip
		"eisenach_cup":
			return $Control/ScrollContainer/VBoxContainer/EisenachCup
		"under_400_hp":
			return $Control/ScrollContainer/VBoxContainer/Under400HP
		"stingray_competition":
			return $Control/ScrollContainer/VBoxContainer/StingrayCompetition
		"schroder_cup":
			return $Control/ScrollContainer/VBoxContainer/SchroderCup
		"gentleman_racers":
			return $Control/ScrollContainer/VBoxContainer/GentlemanRacers
		"japanese_cup":
			return $Control/ScrollContainer/VBoxContainer/JapaneseCup
		"german_cup":
			return $Control/ScrollContainer/VBoxContainer/GermanCup
		"kestrel_max":
			return $Control/ScrollContainer/VBoxContainer/KestrelMax
		"v12_engines":
			return $Control/ScrollContainer/VBoxContainer/V12Engines
		"supercars":
			return $Control/ScrollContainer/VBoxContainer/Supercars
		"track_cars":
			return $Control/ScrollContainer/VBoxContainer/TrackCars
		"sport_racing":
			return $Control/ScrollContainer/VBoxContainer/SportRacing

		_:
			return null
func _update_money_label():
	money_label.text = "$" + str(Cars.money)


func _on_car_dealership_pressed() -> void:
	# Enable dealership mode
	Cars.dealership_mode = true
	
	# Make sure money is loaded and label updated
	Cars.load_money()
	_update_money_label()
	
	# Jump into Car Select scene in dealership mode
	get_tree().change_scene_to_file("res://Scenes/car_select.tscn")
