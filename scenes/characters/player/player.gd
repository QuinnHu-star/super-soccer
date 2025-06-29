class_name Player
extends CharacterBody2D

enum ControlScheme {P1, P2, CPU}
enum State {MOVING, TACKLING, RECOVERING}

@export var control_scheme: ControlScheme
@export var speed: float

## 角色的朝向
var heading := Vector2.RIGHT
## 角色当前状态
var current_state: PlayerState = null
## 玩家状态工厂
var state_factory := PlayerStateFactory.new()

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var player_sprite: Sprite2D = %PlayerSprite


func _ready() -> void:
	switch_state(State.MOVING)


func _process(_delta: float) -> void:
	flip_sprites()
	move_and_slide()


func switch_state(state: State) -> void:
	if current_state != null:
		current_state.queue_free()
	current_state = state_factory.get_fresh_state(state)
	current_state.setup(self, animation_player)
	current_state.state_changed.connect(switch_state.bind())
	current_state.name = "PlayerStateMachine_" + str(state)
	call_deferred("add_child", current_state)


## 设置动动画
func set_movement_abnimation() -> void:
	if velocity.length() > 0:
		animation_player.play(Strname.RUN)
	else:
		animation_player.play(Strname.IDLE)


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
