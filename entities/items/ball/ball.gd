class_name Ball
extends AnimatableBody2D


enum State {
	CARRIED,
	FREEFORM,
	SHOOT,
}

var velocity := Vector2.ZERO
var state_factory := BallStateFactory.new()
var current_state : BallStateBase = null
var carrier: Player = null

@onready var player_detection_area: Area2D = %PlayerDetectionArea


func _ready() -> void:
	switch_state(State.FREEFORM)


func switch_state(state: Ball.State) -> void:
	if current_state != null:
		current_state.queue_free()
	current_state = state_factory.get_new_state(state)
	current_state.setup(self, player_detection_area)
	current_state.state_changed.connect(switch_state.bind())
	current_state.name = "BallStateMachine_" + str(state)
	call_deferred("add_child", current_state)
