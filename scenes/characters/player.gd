class_name Player
extends CharacterBody2D

enum ControlScheme {P1, P2, CPU}

@export var control_scheme: ControlScheme
@export var speed: float

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var player_sprite: Sprite2D = %PlayerSprite

## 角色的朝向
var heading := Vector2.RIGHT


func _process(_delta: float) -> void:
	if control_scheme == ControlScheme.CPU:
		#TODO AI 移动
		pass
	else:
		handle_human_movement()
	
	set_movement_abnimation()
	set_heading()
	flip_sprites()
	move_and_slide()

## 设置动动画
func set_movement_abnimation() -> void:
	if velocity.length() > 0:
		animation_player.play("run")
	else:
		animation_player.play("idle")

## 处理玩家的运动
func handle_human_movement() -> void:
	var direction := KeyUtils.get_input_vector(control_scheme)
	velocity = direction * speed

## 设置角色朝向变量：heading
func set_heading() -> void:
	if velocity.x > 0:
		heading = Vector2.RIGHT
	elif velocity.x < 0:
		heading = Vector2.LEFT

## 根据 heading 变量的值，更新角色精灵的朝向
func flip_sprites() -> void:
	if heading == Vector2.RIGHT:
		player_sprite.flip_h = false
	elif heading == Vector2.LEFT:
		player_sprite.flip_h = true
