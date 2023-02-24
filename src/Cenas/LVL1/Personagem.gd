extends KinematicBody2D

var velocity = Vector2.ZERO
var move_speed = 480
var gravity = 1200
var jump_force = -720
var coins = 0

func _physics_process(delta: float) -> void:
		velocity.y += gravity * delta
		
		var move_direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")) #Código para movimentar o boneco	
		
		if Input.is_action_pressed("ui_up"):
			velocity.y = jump_force/2
		
		velocity.x = move_speed * move_direction
		
		
		move_and_slide(velocity)

#Função de adicionar moeda a contagem global
func adicionar_moeda():
	Global.moedas += 1

