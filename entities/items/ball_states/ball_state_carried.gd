class_name BallStateCarried
extends BallStateBase


func _enter_tree() -> void:
	assert(ball.carrier != null, "携带者为空")


func _process(delta: float) -> void:
	ball.position = ball.carrier.position


func _exit_tree() -> void:
	ball.carrier = null
