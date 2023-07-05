extends KinematicBody2D

var direction = Vector2(1,0)
var is_gun_facing_right = null
var gun_rotation = null
var bullet_speed = 1000

func _physics_process(delta):
	if is_gun_facing_right != null and gun_rotation != null:
		if is_gun_facing_right:
			direction = Vector2.RIGHT.rotated(gun_rotation)
		else:
			direction = Vector2.LEFT.rotated(gun_rotation)
	
	move_and_slide(direction * bullet_speed)
	
	
