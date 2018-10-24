extends Spatial

var speed = 30
var was_shot = false
var active = false
var forward

func fire():
	$missile2/engine_emission.show()
	$missile2/smoke_effect.show()
	$AnimationPlayer.play("fire")
	set_as_toplevel(true)
	forward = get_transform().basis.z.normalized();
func _physics_process(delta):
	if was_shot:
		translation -= forward * speed * delta

func _on_Area_body_entered(body):
	if active:
		was_shot = false
		#body.take_hit()
		$AnimationPlayer.play("hit")

func drop(amt):
	$drop_tween.interpolate_property(self, "translation", translation, Vector3(translation.x, translation.y - amt, translation.z),0.1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT) 
	$drop_tween.start()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fire":
		active = true

func shot():
	was_shot = true
