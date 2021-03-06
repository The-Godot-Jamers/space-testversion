extends Node2D

func _ready():
	set_camera_limits()
	#Input.set_custom_mouse_cursor(load("res://assets/UI/crossair_black.png"), Input.CURSOR_ARROW, Vector2(16, 16))
    #custom mouse does not exsist. 
func set_camera_limits():
	#Add Tile Map Background Tonight 11/5/2018
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$Player2D/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player2D/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player2D/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player2D/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y

func _on_Tank_shoot(bullet, _position, _direction, _target=null):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction, _target)

func _on_Player_dead():
	get_tree().reload_current_scene()