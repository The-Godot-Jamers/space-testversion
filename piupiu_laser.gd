extends Area

var movement = Vector3(0,0,1)
var shooter

func _process(delta):
	translate(movement)


func _on_piupiu_laser_body_entered(body):
	if body != shooter:        #.is_in_group("player"):
		print(body)
		body.take_hit(1)
		queue_free()

func _on_laser_time_timeout():
	queue_free()
