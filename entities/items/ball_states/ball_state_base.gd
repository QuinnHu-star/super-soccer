class_name BallStateBase
extends Node

@warning_ignore("unused_signal")
signal state_changed(new_state: BallStateBase)

var ball: Ball = null
var player_detecation_area: Area2D = null


func setup(_ball: Ball, _player_detecation_area: Area2D) -> void:
	ball = _ball
	player_detecation_area = _player_detecation_area
