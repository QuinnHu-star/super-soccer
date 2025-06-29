class_name PlayerStateBase
extends Node

# 抑制未使用信号警告
@warning_ignore("unused_signal")
signal state_changed(new_state: Player.State)

var player: Player = null
var animation_player: AnimationPlayer = null


func setup(_player: Player, _animation_player: AnimationPlayer) -> void:
	player = _player
	animation_player = _animation_player
