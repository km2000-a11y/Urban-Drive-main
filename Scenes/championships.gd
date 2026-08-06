extends CanvasLayer

func _ready():
	MusicManager.play_menu_music()


func _on_colossus_pressed() -> void:
	GameMode.game_mode = "Club Cups"
	ChampionshipState.active_cup = "colossus"
	ChampionshipState.championship_mode = true

	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")
