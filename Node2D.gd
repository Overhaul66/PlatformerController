extends KinematicBody2D

var direction = Vector2.ZERO
var facing_right = true
var velocity = Vector2.ZERO

func _physics_process(delta):
	
	var mouse_to_player = global_position.direction_to(get_global_mouse_position())
	var facing = mouse_to_player.dot(Vector2.RIGHT)
	
	if facing > 0:
		$gun.rotation_degrees = clamp($gun.rotation_degrees, -45, 45)
		$gun.rotation = lerp_angle($gun.rotation, get_local_mouse_position().angle(), 0.5)
#	elif facing < 0:
#		$gun.rotation_degrees = clamp($gun.rotation_degrees, -90, -180)
#		$gun.rotation = lerp_angle($gun.rotation, get_local_mouse_position().angle(), 0.5)
		
	direction.x = Input.get_axis("ui_left", "ui_right")
	
	velocity.x = direction.x * 100
	
	move_and_slide(velocity)
	
	if direction.x:
		$gun.scale.x = sign(direction.x)
		if direction.x > 0:
			facing_right = true
		else:
			facing_right = false
		
	if Input.is_action_just_pressed("click"):
		var b = preload("res://bullet.tscn")
		var bullet = b.instance()
		bullet.global_position = $gun.get_node("Position2D").global_position
		bullet.is_gun_facing_right = facing_right
		get_parent().add_child(bullet)
		bullet.gun_rotation = $gun.rotation

	
	
	
	
