extends "res://Hancking_Game/Avatars/Tank.gd"

onready var parent = get_parent()

func control(delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + max_speed *delta)
	else:
		#other 
		pass 