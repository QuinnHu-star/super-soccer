class_name PlayerState
extends Node

# 抑制未使用信号警告
@warning_ignore("unused_signal")
signal state_transition_requested(new_state: Player.State)

var player: Player = null
var animation_player: AnimationPlayer = null


func setup(context_player: Player, contest_animation_player: AnimationPlayer) -> void:
	player = context_player
	animation_player = contest_animation_player
