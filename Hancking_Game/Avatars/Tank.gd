extends KinematicBody2D

signal health_changed
signal dead

export (PackedScene) var Bullet
#Kidscancode, can't get it to work. 
export (int) var max_speed
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var health
#exporting varibles would help not having tanks with cloned attributes


#export (int) var sheild
#godot 3.1 option 
#var max_speed: int

#var rotation_speed =1
#var max_speed = 500

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