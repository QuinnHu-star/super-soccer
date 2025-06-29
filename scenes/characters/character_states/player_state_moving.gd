class_name PlayerStateMoving
extends PlayerState


func _process(_delta: float) -> void:
	if player.control_scheme == player.ControlScheme.CPU:
		#TODO AI 移动
		pass
	else:
		handle_human_movement()
	
	player.set_movement_abnimation()
	player.set_heading()


func handle_human_movement() -> void:
	var direction := KeyUtils.get_input_vector(player.control_scheme)
	player.velocity = direction * player.speed
	
	if KeyUtils.is_action_just_pressed(player.control_scheme, KeyUtils.Action.SHOOT) \
			and player.velocity != Vector2.ZERO:
		state_changed.emit(Player.State.TACKLING)
