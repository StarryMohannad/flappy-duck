extends Label

onready var game = get_node("Game")
var labelscore = 0

func _process(delta):
	var score_string = labelscore as String
	self.text = score_string


func _on_Game_scored():
	labelscore = labelscore + 1
