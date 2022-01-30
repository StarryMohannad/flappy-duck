extends KinematicBody2D


func _process(delta):
	if is_on_wall() or is_on_wall() or is_on_ceiling():
		get_tree().reload_current_scene()
