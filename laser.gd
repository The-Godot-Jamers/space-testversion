extends Spatial


func shoot():
	visible = true
	var draw = get_node("ImmediateGeometry") 
	draw.clear()
	draw.begin(Mesh.PRIMITIVE_LINES)
	draw.add_vertex(Vector3())
	if $RayCast.is_colliding():
		draw.add_vertex(Vector3(0.0, 0.0, to_local($RayCast.get_collision_point()).z))
		#$RayCast.get_collider().take_hit()
		get_parent().laser_hit($RayCast.get_collider())
		$Particles.emitting = true
		$Particles.translation = Vector3(0.0, 0.0, to_local($RayCast.get_collision_point()).z) 
	else:
		$Particles.emitting = false
		draw.add_vertex($RayCast.cast_to)
	draw.end()

func dont_shoot():
	$Particles.emitting = false
	$ImmediateGeometry.clear()