extends Position3D


export var zoom_value = 0.5


func _input(event):
	if event.is_action_pressed("zoomin"):
		$Tween.interpolate_property(self,"translation", translation, Vector3(translation.x, translation.y - zoom_value, translation.z), 0.1, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT) 
		$Tween.start()
	elif event.is_action_pressed("zoomout"):
		$Tween.interpolate_property(self,"translation", translation, Vector3(translation.x, translation.y + zoom_value, translation.z), 0.1, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT) 
		$Tween.start()
#warning-ignore:unused_argument
func _process(delta):
	rotation.y = -get_parent().rotation.y


