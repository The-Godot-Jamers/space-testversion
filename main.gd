extends Node

var enemy = preload("res://humanship.tscn")
var bot = preload("res://robot_1.tscn")
var gate = preload("res://stargate.tscn")
var scene2d = "res://Hancking_Game/Test_Map.tscn"

func _input(event):
	#esc to quit
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	#shift-tab to reload scene
	if Input.is_action_just_pressed("ui_focus_prev"):
		get_tree().reload_current_scene()

func transition():
	transition.path = scene2d
	transition.transition_in()

func _ready():
	randomize()
	#creating enemies
	var i = enemy.instance()
	i.translation = Vector3(rand_range(-50.0, 50.0), 0.0, rand_range(-50.0, 50.0))
	add_child(i)
	i = enemy.instance()
	i.translation = Vector3(rand_range(-50.0, 50.0), 0.0, rand_range(-50.0, 50.0))
	add_child(i)
	var b = bot.instance()
	b.translation = Vector3(rand_range(-50.0, 50.0), 0.0, rand_range(-50.0, 50.0))
	add_child(b)
	var g = gate.instance()
	g.translation = Vector3(rand_range(-50.0, 50.0), 0.0, rand_range(-50.0, 50.0))
	add_child(g)
func random_map():
	print("random_map")
	#clear enemies make new ones
	for i in get_children():
		if i.is_in_group("player") or i.is_in_group("environment"):
			pass
		else:
			i.queue_free()
	_ready() #replace this with better one later