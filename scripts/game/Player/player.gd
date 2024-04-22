extends RigidBody2D


var canflap = true
var flaprate = 0.15

func _ready():
	pass

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("flap") and canflap == true:
		$flap.play()
		apply_impulse(Vector2(), Vector2(0, -250))
		Input.start_joy_vibration(0,0.2,0.2,0.1)

		canflap = false
		yield(get_tree().create_timer(flaprate), "timeout")
		canflap = true
	elif Input.is_action_pressed("dive") and canflap == true:
		$dive.play()
		apply_impulse(Vector2(), Vector2(0, 250))
		Input.start_joy_vibration(0,0.2,0.2,0.1)
		
		canflap = false
		yield(get_tree().create_timer(flaprate), "timeout")
		canflap = true
	

func _on_up_pressed():
	$flap.play()
	apply_impulse(Vector2(), Vector2(0, -250))

func _on_down_pressed():
	$dive.play()
	apply_impulse(Vector2(), Vector2(0, 250))


func _on_Game_pisgone():
	queue_free()
