extends Area2D

signal bar_disappered()
signal player_death()

func _on_Area2D_body_entered(body):
	if body.is_in_group("bar"):
		body.point()
		emit_signal("bar_disappered")
		$sound.play()
	elif body.is_in_group("bottem"):
		body.point()
	elif body.is_in_group("player"):
		emit_signal("player_death")
