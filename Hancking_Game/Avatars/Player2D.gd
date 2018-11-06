extends "res://Hancking_Game/Avatars/Tank.gd"

#change inputs to test something
func control(delta):
	$Turret.look_at (get_global_mouse_position())
	var rot_dir = 0
	if Input.is_action_pressed ('ui_right'):
		rot_dir += 1
	if Input.is_action_pressed ('ui_left'):
		rot_dir -= 1
	rotation += rotation_speed * rot_dir * delta
	velocity = Vector2()
	if Input.is_action_pressed('ui_up'):
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed('ui_down'):
		velocity = Vector2(-speed, 0).rotated(rotation) 
		velocity /= 2.0
	position.x = clamp (position.x, $Camera2D.limit_left, $Camera2D.limit_right)
	position.y = clamp (position.y, $Camera2D.limit_top, $Camera2D.limit_bottom)