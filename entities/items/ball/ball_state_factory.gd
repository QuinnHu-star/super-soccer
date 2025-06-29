class_name BallStateFactory


var states: Dictionary


func _init() -> void:
	states = {
		Ball.State.CARRIED: BallStateCarried,
		Ball.State.FREEFORM: BallStateFreeform,
		Ball.State.SHOOT: BallStateShoot,
	}


func get_new_state(state: Ball.State) -> BallStateBase:
	assert(states.has(state), "state doesn't exist!")
	return states.get(state).new()
