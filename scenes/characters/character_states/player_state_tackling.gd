class_name PlayerStateTackling
extends PlayerState


const TACKLE_RECOVER_DURATION := 200
const GROUND_FRICTION := 200.0

var tackle_recover_start_time := Time.get_ticks_msec()
var is_tackling := true


func _enter_tree() -> void:
	animation_player.play("tackle")


func _process(delta: float) -> void:
	if is_tackling:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, GROUND_FRICTION * delta)
		if player.velocity == Vector2.ZERO:
			is_tackling = false
			tackle_recover_start_time = Time.get_ticks_msec()
	else:
		if Time.get_ticks_msec() - tackle_recover_start_time > TACKLE_RECOVER_DURATION:
			state_transition_requested.emit(Player.State.RECOVERING)
