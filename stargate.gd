extends Spatial

#warning-ignore:unused_argument
func _on_Area_body_entered(body):
	var group = get_tree().get_nodes_in_group("player")
	for i in group:
		i.do_stargate()

func activate():
	$AnimationPlayer.play("stargate")
	$AnimationPlayer2.play("rim_effect")

func close():
	$AnimationPlayer.play_backwards("stargate") 
	$AnimationPlayer2.stop()
	
#warning-ignore:unused_argument
func _input(event):
	if Input.is_action_just_pressed("q"):
		activate()
	if Input.is_action_just_pressed("e"):
		close()
	 