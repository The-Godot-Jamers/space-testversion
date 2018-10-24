extends Spatial


func _on_Area_body_entered(body):
	#Fire portal action 
	print("portal action")

func activate():
	$AnimationPlayer.play("stargate")
	$AnimationPlayer2.play("rim_effect")

func close():
	$AnimationPlayer.play_backwards("stargate") 
	$AnimationPlayer2.stop()
	

func _input(event):
	if Input.is_action_just_pressed("q"):
		activate()
	if Input.is_action_just_pressed("e"):
		close()
	 