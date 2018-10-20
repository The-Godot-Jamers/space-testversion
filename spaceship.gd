extends KinematicBody

var speed = 10
var rot_speed = 2
var velocity = Vector3()
var accel = 3
var direction
var missiles = 1



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
	move_and_slide(velocity)
	
	if Input.is_action_pressed("ui_accept"):
		$laser.shoot()
		$laser2.shoot()
	else:
		$laser.dont_shoot()
		$laser2.dont_shoot()
	if Input.is_action_pressed("mouse_left") && missiles > 0:
		var missile = $missile
		missile.fire()
		missiles -= 1


