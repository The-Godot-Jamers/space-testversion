extends KinematicBody

var speed = 10
var rot_speed = 2
var velocity = Vector3()
var accel = 3
var direction
var missiles = 1

func do_stargate():
	$AnimationPlayer.play("stargate")

func laser_hit(who):
	#You hit someone else with your laser
	if who != null && who.is_in_group("enemy"):
		$hit_progress.progress(1)

func _physics_process(delta):
	var rot = Vector3()
	if (Input.is_action_pressed("ui_left")):
		rot += rotation + Vector3(0.0, rot_speed * delta , 0.0);
	if (Input.is_action_pressed("ui_right")):
		rot += rotation + Vector3(0.0, -rot_speed * delta, 0.0);

	if rot:
		transform.basis = Basis() 
		rotate_y(rot.y)
	
	direction = Vector3() 
	var heading = get_global_transform().basis
	if Input.is_action_pressed("ui_up"):
		direction -= heading.z
	if Input.is_action_pressed("ui_down"):
		direction += heading.z
	direction = direction.normalized()
	var target = direction * speed
	velocity = velocity.linear_interpolate(target,accel * delta)
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("ui_accept"):
		$laser.shoot()
		$laser2.shoot()
	else:
		$laser.dont_shoot()
		$laser2.dont_shoot()
	if Input.is_action_pressed("mouse_left") && missiles > 0:
		$missile.fire()
		missiles -= 1

func in_portal():
	print("in portal")
	get_parent().random_map()
	
