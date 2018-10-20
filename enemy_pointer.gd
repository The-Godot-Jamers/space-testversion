extends Position3D

var closest = null

func _process(delta):
	var group = get_tree().get_nodes_in_group("enemy")
	for i in group:
		if closest != null:
			if get_parent().translation.distance_to(i.translation) < get_parent().translation.distance_to(closest.translation):
				closest = i
		else:
			closest = i
	if get_parent().translation.distance_to(closest.translation) < 15.0:
		visible = false
	else:
		visible = true
	look_at(closest.translation, Vector3(0.0, 1.0, 0.0))
	closest = null
