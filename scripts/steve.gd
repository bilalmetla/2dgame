extends KinematicBody2D

"""
define variables and constants
Vector2 is for movement of Object left and right.
"""
var direction_UP = -1 # in godot define floor direction.
var velocity = Vector2(0, 0)
export var speed = 200
export var gravity = 40
export var jump_force = -1300


"""
this physics process function called 60 time in every second.
this is also called game loop.

"""
func _physics_process(delta):
	input()
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.1) # stop character when no button/action pressed
	pass

"""
handle all inputs from keyboard.
left, right, up ....
"""
func input():
	velocity.y = velocity.y + gravity #set gravity forcetomove down.
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	
	if not is_on_floor():
		$Sprite.play("air")

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_force	
	pass


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://scenes/level1.tscn")
	pass # Replace with function body.

