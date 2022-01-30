extends KinematicBody2D

const UP_DIR := Vector2.UP
var _velocity := Vector2.ZERO
var flaprate = 0.15
var canflap = true
export var gravity := 3000.0
export var flap_force := 2500.00

func _ready():
	pass

func _physics_process(delta :float) -> void:
	var is_flaping = Input.is_action_just_pressed("flap")
	var is_not_flapping = Input.is_action_just_released("flap")
	var lose = is_on_wall()
	
	_velocity.y = 0.0
	
	if Input.is_action_just_pressed("flap"):
		_velocity.y = -flap_force
		yield(get_tree().create_timer(flaprate), "timeout")
		_velocity.y = 0.0
	if lose:
		get_tree().quit()
	
	_velocity = move_and_slide(_velocity * UP_DIR)
