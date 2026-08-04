extends CanvasLayer

func _ready():
	MusicManager.play_menu_music()



func _on_road_challenge_pressed() -> void:
	GameMode.game_mode="Road Challenge"
	if GameMode.game_mode == "Road Challenge":
			Modes.mode = "Normal Race"
			get_tree().change_scene_to_file("res://Scenes/car_select.tscn")
			return


func _on_free_race_pressed() -> void:
	GameMode.game_mode="Free Race"
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")
