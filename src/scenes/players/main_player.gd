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
	#Cria a gravidade
	movement.y += GRAVITY * delta
	
	#Detecta o input do jogador. -1 caso seja left e 1 caso right.
	var direction = Input.get_axis("left", "right")
	
	#Animação para pulo
	if is_jumping == true:
		$sprite/animation_player.play("sandra_jumping")
	
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
			$sprite/animation_player.play("sandra_running")
		else:
			$sprite/animation_player.play("sandra_idle")
	
	#Direciona o sprite para o lado no qual o jogador está indo
	if direction < 0:
		$sprite.flip_h = true
	if direction > 0:
		$sprite.flip_h = false
			
	#Verifica se o jogador quis pular e se já não está pulando. Caso true, ele pula.
	if (Input.is_action_just_pressed("jump") and !is_jumping):
		is_jumping = true
		jump()
		
	if Global.jump and !is_jumping:
		is_jumping = true
		jump()
	
	#Função para movimentação (horizontal e vertical)
	movement = move_and_slide(movement, Vector2.UP, true)
		
func jump():
	movement.y = -JUMP_FORCE
