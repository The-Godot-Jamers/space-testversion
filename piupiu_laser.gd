extends Area

var movement = Vector3(0,0,50)
var shooter

func _process(delta):
	translate(movement * delta)


func _on_piupiu_laser_body_entered(body):
	if body != shooter:       
		if !body.is_in_group("ignore"):
			body.take_hit(1)
		queue_free()

func _on_laser_time_timeout():
	queue_free()
