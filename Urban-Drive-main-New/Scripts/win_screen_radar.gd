extends CanvasLayer

@onready var reward_label := $Control/Panel/RewardLabel

func show_win(success: bool):
	var text := ""

	if success:
		text = "YOU WIN!"
	else:
		text = "YOU LOSE!"

	# ROAD CHALLENGE PROGRESS
	if GameMode.game_mode == "Road Challenge":
		var group := RoadChallengeState.active_group
		var done :int = RoadChallengeSave.progress[group]

	# Set title
	$Control/Panel/VBoxContainer/Label_Title.text = text

	# CLUB CUPS MONEY REWARD
	if success and GameMode.game_mode == "Club Cups":
		reward_label.visible = true
		reward_label.text = "+ $4000 Reward"
		Cars.money+=4000
		Cars.save_money()
	else:
		reward_label.visible = false

	visible = true



func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/mode_select.tscn")
