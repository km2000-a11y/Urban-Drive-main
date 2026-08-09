extends CanvasLayer

func _ready():
	MusicManager.play_menu_music()

	# Disable championship buttons based on Road Challenge unlocks
	$Control/VBoxContainer/StreetTuners.disabled = not RoadChallengeSave.unlocked["compact"]
	$Control/VBoxContainer/MuscleHustle.disabled = not RoadChallengeSave.unlocked["muscle"]
	$Control/VBoxContainer/V6Engines.disabled = not RoadChallengeSave.unlocked["compact"]
	$Control/VBoxContainer/ZenithCompetition.disabled = not RoadChallengeSave.unlocked["compact"]


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


func _on_back_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_zenith_competition_pressed() -> void:
	GameMode.game_mode="Club Cups"
	ChampionshipState.active_cup="zenith_competition"
	ChampionshipState.championship_mode=true
	
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")
