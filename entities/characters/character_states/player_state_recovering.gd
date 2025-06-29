class_name PlayerStateRecovering
extends PlayerStateBase


const RECOVER_DURATION := 300

var recovery_start_time := Time.get_ticks_msec()


func _enter_tree() -> void:
	recovery_start_time = Time.get_ticks_msec()
	player.velocity = Vector2.ZERO
	animation_player.play(Strname.RECOVER)


func _process(delta: float) -> void:
	if Time.get_ticks_msec() - recovery_start_time > RECOVER_DURATION:
		state_changed.emit(Player.State.MOVING)
