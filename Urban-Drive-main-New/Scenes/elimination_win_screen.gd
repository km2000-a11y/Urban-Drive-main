extends CanvasLayer

@onready var title_label := $Control/Panel/TitleLabel
@onready var retry_button := $Control/Panel/RetryBtn
@onready var quit_button := $Control/Panel/QuitBtn
@onready var reward_label := $Control/Panel/RewardLabel

func show_results(player_won: bool):
	var text := ""

	if player_won:
		text = "YOU WIN!"
	else:
		text = "YOU LOSE!"

	# ROAD CHALLENGE PROGRESS
	if GameMode.game_mode == "Road Challenge":
		var group := RoadChallengeState.active_group
		var done :int = RoadChallengeSave.progress[group]
		var left := 5 - done

		if left > 0:
			text += "\nRaces left: %d / 5" % left
		else:
			text += "\nChallenge Complete!"

	title_label.text = text

	# CLUB CUPS MONEY REWARD
	if player_won and GameMode.game_mode == "Club Cups":
		reward_label.visible = true
		reward_label.text = "+ $4000 Reward"
		Cars.money+=4000
		Cars.save_money()
	else:
		reward_label.visible = false

	visible = true



func _on_retry_btn_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")
