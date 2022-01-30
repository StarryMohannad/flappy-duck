extends Node2D

var filescore = 0
var score = 0
var hardscorelimit = 5
var pdiedresetcooldown = 0.25

signal levelup()
signal scored()
signal pisgone()

func _process(delta):
	if Input.is_action_pressed("exit"):
		get_tree().quit()
	
	if score > hardscorelimit:
		emit_signal("levelup")
		hardscorelimit = hardscorelimit * 2

func pdied():
	emit_signal("pisgone")
	Input.vibrate_handheld(100)
	get_tree().reload_current_scene()

func _on_WallDestroyer_player_death():
	pdied()

func _on_WallDestroyer_bar_disappered():
	score = score + 1
	emit_signal("scored")

func _on_down_player_death():
	pdied()

func _on_top_player_death():
	pdied()
