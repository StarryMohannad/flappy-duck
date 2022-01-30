extends Area2D

signal player_death()

func _on_down_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("player_death")


func _on_top_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("player_death")
