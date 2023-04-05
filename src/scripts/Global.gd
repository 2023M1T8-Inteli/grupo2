extends Node
#Número de vidas do personagem. O máximo é 5.
var number_of_lifes = 5
#Controla se o personagem pode se movimentar ou não (não pode nos casos de morte e enquanto um diálogo está ativo)
var can_control = true
#Informa se o personagem está morto
var is_dead = false
#Informa se o diálogo daquele nível já acabou
var has_dialog_finished = false
#Informa se o jogador pegou o item colecionável da fase
var was_item_caught = false
#Informa se a caixa de diálogo está ativa
var is_dialog_active = false
#Informa se a caixa de feedback das perguntas está ativa
var is_feedback_box_active = false
#Informa se o personagem pode avançar para o próximo level. Recebe true quando a pessoa finaliza o diálogo e coleta o item da fase
var can_go_to_next_level = false
#Armazena qual NPC será exibido. Cada número corresponde a um NPC diferente
var npc = 0
#Nível que o jogador está
var level = 0

#Quando tecla touch de pulo está pressionada, recebe true. Quando solta, recebe false
var jump = false
#Quando tecla touch de se movimentar para a esquerda está pressionada, recebe true. Quando solta, recebe false
var left = false
#Quando tecla touch de se movimentar para a direita está pressionada, recebe true. Quando solta, recebe false
var right = false

#Volume do jogo
var volume = 0
