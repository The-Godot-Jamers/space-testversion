extends KinematicBody2D

signal health_changed
signal dead

export (PackedScene) var Bullet
export (int) var speed
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var health
#export (int) var sheild


var velocity = Vector2()
var can_shoot = true
var alive = true  #for death animations

func _ready():
	$GunTimer.wait_time = 30#gun_cooldown
func control(delta):
	pass
	
func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)