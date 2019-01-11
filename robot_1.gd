extends KinematicBody

var piupiu = preload("res://piupiu_laser.tscn")
var target
var move_speed = 50
var velocity = Vector3()
var accel = 3
var test = 0

func _ready():
	target = globals.player

func _physics_process(delta):
	$Tween.interpolate_property(self, "transform",transform,transform.looking_at(target.translation,Vector3(0,1,0)),0.2,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
	
	if translation.distance_to(target.translation) > 5:
		var direction = Vector3()
		var heading = get_global_transform().basis
		direction -= heading.z
		direction = direction.normalized()
		var target_move = direction * move_speed
		velocity = velocity.linear_interpolate(target_move,accel * delta)
		test += 1
		if test > 100:
			print(translation.distance_to(target.translation))
			print(velocity)
			test = 0
		velocity.y = 0
		velocity = move_and_slide(velocity)

func _on_laser_timer_timeout():
	var laser = piupiu.instance()
	laser.translation = translation
	laser.shooter = self
	laser.rotation.y = rotation.y - deg2rad(180)
	get_parent().add_child(laser)
	$AnimationPlayer.play("Shot")

func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("Follow")
