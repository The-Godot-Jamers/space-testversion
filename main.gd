extends Node

var bot1 = preload("res://robot_1.tscn")
var bot2 = preload("res://robot_2.tscn")
var gate = preload("res://stargate.tscn")
var scene2d = "res://Hancking_Game/Test_Map.tscn"

#warning-ignore:unused_argument
func _input(event):
	#esc to quit
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	#shift-tab to reload scene
	if Input.is_action_just_pressed("ui_focus_prev"):
#warning-ignore:return_value_discarded
		get_tree().reload_current_scene()

func transition():
	transition.path = scene2d
	transition.transition_in()

func _ready():
	randomize()
	#creating enemies
#	var i = enemy.instance()
#	i.translation = Vector3(rand_range(-50.0, 50.0), 0.0, rand_range(-50.0, 50.0))
#	add_child(i)
#	i = enemy.instance()
#	i.translation = Vector3(rand_range(-50.0, 50.0), 0.0, rand_range(-50.0, 50.0))
#	add_child(i)
	
	for i in 5:
		var b = bot1.instance()
		if randi() % 2 > 0:
			b = bot1.instance()
		else:
			b = bot2.instance()
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