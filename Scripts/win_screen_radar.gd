extends CanvasLayer

func show_win(success: bool):
	var text := ""

	if success:
		text = "YOU WIN!"
	else:
		text = "YOU LOSE!"

	# ROAD CHALLENGE PROGRESS
	if GameMode.game_mode == "Road Challenge":
		var group := RoadChallengeState.active_group
		var done :intw= RoadChallengeSave.progress[group]
		var left := 5 - done

		if left > 0:
			text += "\nRaces left: %d / 5" % left
		else:
			text += "\nChallenge Complete!"

	$Control/Panel/VBoxContainer/Label_Title.text = text
	visible = true


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")
