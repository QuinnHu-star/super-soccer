class_name BallStateFreeform
extends BallStateBase


func _enter_tree() -> void:
	player_detecation_area.body_entered.connect(on_player_entered.bind())


func on_player_entered(body: Player) -> void:
	ball.carrier = body
	state_changed.emit(Ball.State.CARRIED)
