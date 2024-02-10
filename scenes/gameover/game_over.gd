extends Control

@onready var go_label = $GOLabel
@onready var space_label = $SpaceLabel
@onready var timer = $Timer
@onready var sound = $Sound

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)

func on_plane_died():
	sound.play()
	show()
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible and space_label.visible and Input.is_action_just_pressed("fly"):
		GameManager.load_main_scene()


func _on_timer_timeout():
	space_label.visible = true
	go_label.visible = false
