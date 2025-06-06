class_name PlayerStateRecovering
extends PlayerState


const RECOVER_DURATION := 300

var recovery_start_time := Time.get_ticks_msec()


func _enter_tree() -> void:
	recovery_start_time = Time.get_ticks_msec()
	player.velocity = Vector2.ZERO
	animation_player.play("recover")


func _process(delta: float) -> void:
	if Time.get_ticks_msec() - recovery_start_time > RECOVER_DURATION:
		state_transition_requested.emit(Player.State.MOVING)
