extends KinematicBody

var piupiu = preload("res://piupiu_laser.tscn")
var target
var move_speed = 400
var velocity = Vector3()
var accel = 2
#var rot_speed = 2
var hitpoints = 15

func take_hit(amt):
	hitpoints -= amt
	if hitpoints <= 0:
		#dying needs to be changed for better
		queue_free()

func _ready():
	target = globals.player
	$laser_timer.wait_time += rand_range(-0.2, 0.2)

func _physics_process(delta):
	
	look_at(target.translation,Vector3(0,1,0)) #need to replace with something not instant.
	
	if translation.distance_to(target.translation) > 5:
		var direction = Vector3()
		var heading = get_global_transform().basis
		direction -= heading.z
		direction = direction.normalized()
		var target_move = direction * move_speed * delta
		velocity = velocity.linear_interpolate(target_move,accel * delta)
		velocity.y = 0
		velocity = move_and_slide(velocity)
	
		#for fixing the place in the plane
	translation.y = 0

func _on_laser_timer_timeout():
	if translation.distance_to(target.translation) < 20:
		var laser = piupiu.instance()
		laser.translation = to_global($cannon.translation)
		laser.shooter = self
		laser.rotation.y = rotation.y - deg2rad(180)
		get_parent().add_child(laser)
		
		$AnimationPlayer.play("Shot-V")

#warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("Follow")