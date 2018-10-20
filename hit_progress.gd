extends TextureProgress


func _ready():
	visible = false


func progress(amt):
	if amt == 0:
		visible = false
		value = 0
	else:
		$reset_timer.start(0.5)
		visible = true
		value += amt

func _on_reset_timer_timeout():
	visible = false
	value = 0
