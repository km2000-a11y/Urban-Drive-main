extends CanvasLayer

func _on_bogota_airport_pressed():
	RoadChallengeState.active_track = "BogotaAirport"
	TrackName.track_name = "BogotaAirport"

	if GameMode.game_mode == "Multi-Device":
		if multiplayer.is_server():
			# HOST sends track to clients
			rpc("rpc_set_track", "BogotaAirport")
			# HOST loads race
			get_tree().change_scene_to_file("res://main.tscn")
		else:
			# CLIENT waits
			print("Client waiting for host to start race")
		return

	# Single player
	get_tree().change_scene_to_file("res://main.tscn")


func _on_chernobyl_pressed():
	RoadChallengeState.active_track = "Chernobyl"
	TrackName.track_name = "Chernobyl"

	if GameMode.game_mode == "Multi-Device":
		if multiplayer.is_server():
			rpc("rpc_set_track", "Chernobyl")
			get_tree().change_scene_to_file("res://main.tscn")
		else:
			print("Client waiting for host to start race")
		return

	get_tree().change_scene_to_file("res://main.tscn")


func _on_abu_dhabi_pressed():
	RoadChallengeState.active_track = "AbuDhabi"
	TrackName.track_name = "AbuDhabi"

	if GameMode.game_mode == "Multi-Device":
		if multiplayer.is_server():
			rpc("rpc_set_track", "AbuDhabi")
			get_tree().change_scene_to_file("res://main.tscn")
		else:
			print("Client waiting for host to start race")
		return

	get_tree().change_scene_to_file("res://main.tscn")


func _on_split_pressed():
	RoadChallengeState.active_track = "Split"
	TrackName.track_name = "Split"

	if GameMode.game_mode == "Multi-Device":
		if multiplayer.is_server():
			rpc("rpc_set_track", "Split")
			get_tree().change_scene_to_file("res://main.tscn")
		else:
			print("Client waiting for host to start race")
		return

	get_tree().change_scene_to_file("res://main.tscn")


@rpc("any_peer")
func rpc_set_track(track_name):
	TrackName.track_name = track_name
	# CLIENT loads race when host tells it
	get_tree().change_scene_to_file("res://main.tscn")
