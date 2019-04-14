extends Node

var mat 
var path 

func _ready():
	mat = $ColorRect.material

func transition_in():
	$Tween.interpolate_property(mat, "shader_param/value", 0.0, 1.0, 1.5, Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()

func transition_out():
	path = null
	$Tween.interpolate_property(mat, "shader_param/value", 1.0, 0.0, 1.5, Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()

func _on_Tween_tween_completed(object, key):
	if path != null:
		get_tree().change_scene_to(load(path))
		transition_out()
