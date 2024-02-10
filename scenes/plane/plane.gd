extends CharacterBody2D

#signal on_plane_died

const GRAVITY: float = 1500.0
const POWER: float = -500.0


@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var engine_sound = $EngineSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor():
		die()
	

func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("power")

func die() -> void:
	sprite_2d.stop()
	set_physics_process(false)
	SignalManager.on_plane_died.emit()
	engine_sound.stop()
