extends Node

var peer: ENetMultiplayerPeer
var is_host := false

signal status_changed(msg)

const PORT := 7777
const MAX_PLAYERS := 4   # your requirement

func start_host():
	is_host = true
	peer = ENetMultiplayerPeer.new()

	var result := peer.create_server(PORT, MAX_PLAYERS)

	if result != OK:
		emit_signal("status_changed", "Failed to start host")
		return

	multiplayer.multiplayer_peer = peer
	emit_signal("status_changed", "Hosting for up to %d players" % MAX_PLAYERS)

	# Connect signals
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)

func join_host(ip: String):
	is_host = false
	peer = ENetMultiplayerPeer.new()

	var result := peer.create_client(ip, PORT)

	if result != OK:
		emit_signal("status_changed", "Failed to connect")
		return

	multiplayer.multiplayer_peer = peer
	emit_signal("status_changed", "Connecting to %s..." % ip)

	# Connect signals
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)

func _on_peer_connected(id):
	if is_host:
		emit_signal("status_changed", "Player %d joined" % id)
	else:
		emit_signal("status_changed", "Connected to host")
	emit_signal("status_changed", "Player %d joined" % id)

# Tell the race scene to spawn a remote player
	rpc("notify_spawn_remote", id, Cars.selected_car)

func _on_peer_disconnected(id):
	if is_host:
		emit_signal("status_changed", "Player %d left" % id)
	else:
		emit_signal("status_changed", "Disconnected from host")
		
@rpc("any_peer")
func notify_spawn_remote(id, car_path):
	var scene := get_tree().current_scene
	if scene and scene.has_method("spawn_remote_player"):
		scene.spawn_remote_player(id, car_path)
