extends KinematicBody

var piupiu = preload("res://piupiu_laser.tscn")


func _on_laser_timer_timeout():
	var laser = piupiu.instance()
	laser.translation = translation
	laser.shooter = self
	get_parent().add_child(laser)
