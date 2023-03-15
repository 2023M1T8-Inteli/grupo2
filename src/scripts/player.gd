extends KinematicBody2D

const GRAVITY = 1000
const SPEED = 200
const JUMP_FORCE = 430
const STANDART_ZOOM = lerp(1, 0.65, 1)
const CLOSE_ZOOM = lerp(1, 0.65, 1)
var is_jumping = false
var movement = Vector2.ZERO

func _ready():
	$animation_player.play("running_sandra")

func _process(delta):
	#Apply zoom
	if Global.is_near_NPC:
		$camera2D.zoom = Vector2(CLOSE_ZOOM, CLOSE_ZOOM)
	else:
		$camera2D.zoom = Vector2(STANDART_ZOOM, STANDART_ZOOM)
	#Create the gravity
	movement.y += GRAVITY * delta
	
	#Player's direction
	#the variable "direction" can assume 3 values
	# 0 if the player is standing
	# -1 if the player is moving to left
	# 1 if the player is moving to right
	var direction = Input.get_axis("left", "right")
	
	if Global.left:
		direction = -1
	
	if Global.right:
		direction = 1
		
	movement.x = direction * SPEED
	
	#Switch the player's direction between left and right
	if direction < 0:
		$sprite.flip_h = true
	if direction > 0:
		$sprite.flip_h = false
	
	#check if the player is touching the floor
	if is_on_floor():
		#set the value of is_jumping to false	
		is_jumping = false
		#Player's animation
		if direction != 0:
			$animation_player.play("running_sandra")
		else:
			$animation_player.play("idle_sandra")
		
	#Player's jupping
	if (Input.is_action_just_pressed("jump") and !is_jumping) or (Global.jump and !is_jumping):
		$animation_player.play("jumping_sandra")
		is_jumping = true
		jump()
		
	if Global.is_near_NPC and Input.is_action_just_pressed("interact"):
		Global.dia = true
	
	#movement
	movement = move_and_slide(movement, Vector2.UP, true)
	
func jump():
	movement.y = -JUMP_FORCE
