extends "res://Hancking_Game/Avatars/Tank.gd"

onready var parent = get_parent()

export (float) var turret_speed
export (int) var detect_radius   
#var speed = 0
# 132019 Took this out and replaced it with max_speed. 

var target = null

func _ready():
	$DetectRadius/CollisionShape2D.shape.radius = detect_radius

func control(delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + max_speed *delta)
		position= Vector2 () 
	else:
		#other 
		pass 

func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated($Turret.global_rotation)
		$Turret.global_rotation = current_dir.linear_interpolate(target_dir, turret_speed * delta).angle()
		#if target_dir.dot(current_dir) > 0.9: 
		#	shoot(gun_shots, gun_spread, target)
	
func _on_DetectRadius_body_entered(body):
	if body.name == "Player2D":
		target = body 

func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null
