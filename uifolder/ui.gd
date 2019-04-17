extends Control

var spaceship = preload("res://spaceship.tscn")

func _on_spaceship_get_hit(damage):
	$TextureProgress.value -= damage
