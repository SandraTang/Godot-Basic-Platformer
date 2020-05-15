extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -400

var motion = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# gravity
	motion.y += GRAVITY
	# motion x
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	# jumping
	if is_on_floor(): 
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		
	motion = move_and_slide(motion, UP)
	pass
