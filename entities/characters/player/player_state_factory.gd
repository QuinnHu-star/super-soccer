class_name PlayerStateFactory


var states: Dictionary


func _init() -> void:
	states = {
		Player.State.MOVING: PlayerStateMoving,
		Player.State.TACKLING: PlayerStateTackling,
		Player.State.RECOVERING: PlayerStateRecovering,
	}


func get_new_state(state: Player.State) -> PlayerStateBase:
	assert(states.has(state), "State not found")
	return states.get(state).new()
