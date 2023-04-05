extends KinematicBody2D

#Define as constante de movimentações
const GRAVITY = 1000
const SPEED = 200
const JUMP_FORCE = 530

#Variável utilizada para prevenir double jump
var is_jumping = false

#Vetor utilizado para a movimentação
var movement = Vector2.ZERO

func _ready():
	$sprite/animation_player.play("sandra_idle")
	
func _process(delta):
	if Global.level == 2:
		$Camera2D.limit_right = 2815
	
	if Global.level == 3:
		$Camera2D.limit_right = 3390
	
	if Global.level == 4:
		$Camera2D.limit_right = 4095
		$Camera2D.position.y = 190
		$Camera2D.drag_margin_top = 0.4
	
	if Global.level == 5:
		$Camera2D.limit_right = 3390
		$Camera2D.drag_margin_top = 0.6
		$Camera2D.drag_margin_bottom = 0.3
	
	if Global.level == 6:
		$Camera2D.limit_right = 3050
		$Camera2D.drag_margin_top = 1
		$Camera2D.drag_margin_bottom = 1

	if Global.level == 7:
		$Camera2D.limit_right = 1696
		
	#Cria a gravidade
	movement.y += GRAVITY * delta
	
	#Detecta o input do jogador. -1 caso seja left e 1 caso right.
	var direction = Input.get_axis("left", "right")
	
	#Animação para pulo
	if is_jumping == true:
		if Global.level == 1 or Global.level == 2:
				$sprite/animation_player.play("sandra_jumping")
		elif Global.level == 3 or Global.level == 4:
			$sprite/animation_player.play("ricardinho_jumping")
		else:
			$sprite/animation_player.play("claudemir_jumping")
	
	if Global.left:
		direction = -1
	
	if Global.right:
		direction = 1
		
	#Movimentação horizontal
	movement.x = direction * SPEED
	
	#Verifica se o personagem está no chão para setar o valor da variável is_jumping e garantir as animações corretas
	if is_on_floor():
		is_jumping = false
		
		if direction != 0:
			if Global.level == 1 or Global.level == 2:
				$sprite/animation_player.play("sandra_running")
			elif Global.level == 3 or Global.level == 4:
				$sprite/animation_player.play("ricardinho_running")
			else:
				$sprite/animation_player.play("claudemir_running")
		else:
			if Global.level == 1 or Global.level == 2:
				$sprite/animation_player.play("sandra_idle")
			elif Global.level == 3 or Global.level == 4:
				$sprite/animation_player.play("ricardinho_idle")
			else:
				$sprite/animation_player.play("claudemir_idle")
	
	#Direciona o sprite para o lado no qual o jogador está indo
	if direction < 0:
		$sprite.flip_h = true
	if direction > 0:
		$sprite.flip_h = false
			
	#Verifica se o jogador quis pular e se já não está pulando. Caso true, ele pula.
	if (Input.is_action_just_pressed("jump") and !is_jumping) and Global.can_control:
		is_jumping = true
		jump()
		
	if Global.jump and !is_jumping:
		is_jumping = true
		jump()
	
	#Função para movimentação (horizontal e vertical)
	if Global.can_control:
		movement = move_and_slide(movement, Vector2.UP, true)
	
	if Global.is_dead == true:
		if Global.level == 1 or Global.level == 2:
			$sprite/animation_player.play("sandra_death")
		elif Global.level == 3 or Global.level == 4:
			$sprite/animation_player.play("ricardinho_death")
		else:
			$sprite/animation_player.play("claudemir_death")
		
func jump():
	SfxEffects._jump()
	movement.y = -JUMP_FORCE
