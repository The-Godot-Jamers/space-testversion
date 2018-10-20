extends Camera

export (float, 0.0, 1.0) var sensitivity = 0.5
export (float, 0.0, 0.999, 0.001) var smoothness = 0.5 
export (int, 0, 360) var yaw_limit = 360
export (int, 0, 360) var pitch_limit = 360
export var zoom_value = 0.5

var mouse_position = Vector2(0.0, 0.0)
var yaw = 0.0
var pitch = 0.0
var total_yaw = 0.0
var total_pitch = 0.0

var direction = Vector3(0.0, 0.0, 0.0)

func _input(event):
	if event is InputEventMouseMotion && Input.is_action_pressed("mouse_right"):
		mouse_position = event.relative
	if event.is_action_pressed("zoomin"):
		$Tween.interpolate_property(self,"translation", translation, Vector3(translation.x, translation.y, translation.z - zoom_value), 0.1, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT) 
		$Tween.start()
	elif event.is_action_pressed("zoomout"):
		$Tween.interpolate_property(self,"translation", translation, Vector3(translation.x, translation.y, translation.z + zoom_value), 0.1, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT) 
		$Tween.start()

func _process(delta):
	if mouse_position:
		mouse_position *= sensitivity
		yaw = yaw * smoothness + mouse_position.x * (1.0 - smoothness)
		pitch = pitch * smoothness + mouse_position.y * (1.0 - smoothness)
		mouse_position = Vector2(0, 0)
		if yaw_limit < 360:
			yaw = clamp(yaw, -yaw_limit - total_yaw, yaw_limit - total_yaw)
		if pitch_limit < 360:
			pitch = clamp(pitch, -pitch_limit - total_pitch, pitch_limit - total_pitch)
		total_yaw += yaw
		total_pitch += pitch
		var target = get_parent().translation
		var offset = translation.distance_to(target)
		translation = target
		get_parent().rotate_y(deg2rad(-yaw))
		get_parent().rotate_object_local(Vector3(1,0,0), deg2rad(-pitch))
		translate(Vector3(0.0, 0.0, offset))
		

