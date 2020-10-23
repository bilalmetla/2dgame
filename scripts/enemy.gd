extends KinematicBody2D

var velocity = Vector2()
var gravity = 20
export (int) var enemy_speed = 50
var is_left = false
export var enemy_direction = true
export var detect_cliff = true


func _ready():
	if enemy_direction == true:
		$AnimatedSprite.flip_h = true
	$floor_checker.enabled = detect_cliff
	floor_check_for_end()
	pass


func _physics_process(delta):
	velocity.y += gravity
	if is_on_wall() or not $floor_checker.is_colliding() and detect_cliff and is_on_floor():
		if enemy_direction == true:
			enemy_direction = false			
		elif enemy_direction == false:
			 enemy_direction = true
	
	enemy_direction_check()
	
	velocity = move_and_slide(velocity, Vector2.UP)


func enemy_direction_check():
	if enemy_direction == is_left:
		velocity.x = -enemy_speed
		$AnimatedSprite.flip_h = false
		floor_check_for_end()
	elif enemy_direction != is_left:
		velocity.x = enemy_speed
		$AnimatedSprite.flip_h = true
		floor_check_for_end()


func floor_check_for_end():
	if $AnimatedSprite.flip_h == true:
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x
	elif $AnimatedSprite.flip_h == false:
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * -1


func _on_top_checker_body_entered(body):
	print(body)
	print(self)
	if body != self :
		$AnimatedSprite.play("squas")
		set_collision_layer_bit(2, false)
		set_collision_mask_bit(0, false)
		$top_checker.set_collision_layer_bit(2, false)
		$top_checker.set_collision_mask_bit(0, false)
		#queue_free()
		enemy_speed = 0
	pass # Replace with function body.
