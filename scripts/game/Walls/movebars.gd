extends KinematicBody2D

var speed = 15


func _process(delta):
	var movedir = Vector2(-50, 0)
	move_and_slide(movedir * speed)

func point():
	queue_free()
