extends CanvasLayer


func _on_bogota_airport_pressed():
	# Set the root node name of the track
	TrackName.track_name = "BogotaAirport"

	# Load main scene
	get_tree().change_scene_to_file("res://main.tscn")

#Hi i am karim mir I am 11 years old 

func _on_back_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/car_select.tscn")

#Hello again bye again 

#Goodbye guys 
