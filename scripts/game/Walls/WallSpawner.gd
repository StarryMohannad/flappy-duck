extends Node2D

var rng = RandomNumberGenerator.new()
var canrandomhight = false
var spawnrate = 4
var canspawn = true

var high0 = load("res://scenes/walls/0.tscn")
var high1 = load("res://scenes/walls/1.tscn")

func _process(_delta):
	# spawn bars
	if canrandomhight == true and canspawn == true:
		var wallhight = rng.randi_range(0, 1)
		
		print(wallhight)
		if wallhight == 0:
			var wallinst = high0.instance()
			wallinst.position = global_position
			add_child(wallinst)
		if wallhight == 1:
			var wallinst = high1.instance()
			wallinst.position = global_position
			add_child(wallinst)
		
		canspawn = false
		yield(get_tree().create_timer(spawnrate), "timeout")
		canspawn = true
	elif canrandomhight == false and canspawn == true:
		var wallinst = high1.instance()
		wallinst.position = global_position
		add_child(wallinst)
		canrandomhight = true
		canspawn = false
		yield(get_tree().create_timer(spawnrate), "timeout")
		canspawn = true

func _on_Game_levelup():
	spawnrate = spawnrate / 2
