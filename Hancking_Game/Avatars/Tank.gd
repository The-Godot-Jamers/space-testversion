extends KinematicBody2D

signal health_changed
signal dead
signal shoot

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

#THis needs to be fixed 1/25/2019
func shoot(num, spread, target=null):
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1, 0).rotated($Turret.global_rotation)
		if num > 1:
			for i in range(num):
				var a = -spread + i * (2*spread)/(num-1)
				emit_signal('shoot', Bullet, $Turret/Muzzle.global_position, dir.rotated(a), target)
		else:
			emit_signal('shoot', Bullet, $Turret/Muzzle.global_position, dir, target)
		$AnimationPlayer.play('muzzle_flash')

func _ready():
	$GunTimer.wait_time = 30#gun_cooldown
func control(delta):
	pass
	
func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)