extends KinematicBody2D

var velocity = Vector2.ZERO
var move_speed = 370
var gravity = 900
var jump_force = -720
var is_grounded
onready var  raycasts = $raycasts
var touch_left = false
var touch_right = false
var touch_jump = false

func _ready():
	if Global.jogador_escolhido == 1:
		$AnimationPlayer.play("idleTEC")
	if Global.jogador_escolhido == 2:
		$AnimationPlayer.play("idleADM")
	if Global.jogador_escolhido == 3:
		$AnimationPlayer.play("idleEXEC")

func _physics_process(delta: float) -> void:
		velocity.y += gravity * delta
		
		_get_input()
		
		
		move_and_slide(velocity)	
		
		is_grounded = _check_is_ground() 
		
func _get_input():
	var move_direction = int(Input.is_action_pressed("ui_right")or touch_right) - int(Input.is_action_pressed("ui_left")or touch_left) 
	velocity.x = move_speed * move_direction
	
	if Global.jogador_escolhido == 2:
		
		if Input.is_action_just_pressed("ui_right") or touch_right:
			$AnimationPlayer.play("walkADM")
		if Input.is_action_just_released("ui_right") or touch_right:
			$AnimationPlayer.play("idleADM")
		if Input.is_action_just_pressed("ui_left") or touch_left:
			$AnimationPlayer.play("walkADM")
		if Input.is_action_just_released("ui_left") or touch_left:
			$AnimationPlayer.play("idleADM")
	
	if Global.jogador_escolhido == 1:

		if Input.is_action_just_pressed("ui_right") or touch_right:
			$AnimationPlayer.play("walkTEC")
		if Input.is_action_just_released("ui_right") or touch_right:
			$AnimationPlayer.play("idleTEC")
		if Input.is_action_just_pressed("ui_left") or touch_left:
			$AnimationPlayer.play("walkTEC")
		if Input.is_action_just_released("ui_left") or touch_left:
			$AnimationPlayer.play("idleTEC")
	
	if Global.jogador_escolhido == 3:
		if Input.is_action_just_pressed("ui_right") or touch_right:
			$AnimationPlayer.play("walkEXEC")
		if Input.is_action_just_released("ui_right") or touch_right:
			$AnimationPlayer.play("idleEXEC")
		if Input.is_action_just_pressed("ui_left") or touch_left:
			$AnimationPlayer.play("walkEXEC")
		if Input.is_action_just_released("ui_left") or touch_left:
			$AnimationPlayer.play("idleEXEC")

	if move_direction !=0:
		$texture.scale.x = move_direction


	if move_direction !=0:
		$texture.scale.x = move_direction
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up") or touch_jump:
		velocity.y = jump_force / 2
		
		#Não funciona
func _check_is_ground():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false		


func adicionar_moeda():
	Global.moedas += 1


func _on_left_pressed():
	touch_left = true

func _on_left_released():
	touch_left = false

func _on_right_pressed():
	touch_right = true

func _on_right_released():
	touch_right = false
	
func _on_jump_pressed():
	touch_jump = true

func _on_jump_released():
	touch_jump = false
