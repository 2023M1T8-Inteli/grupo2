extends CanvasLayer

#Array que irá conter os diálogos de todos os levels. Por enquanto, está apenas com o level 1. Ele segue a seguinte lógica:
#	Cada level fica dentro de um dictionary e está associado a uma posição do array, level 01 é a posição 0 e assim por diante
#	Dentro de cada level há várias dicionários que correspondem as questões que será feitas naquela fase
#	Cada question contém três partes: speech, que são as falas referentes ao NPC, e answer_01 e answer_02, que são as opções que o jogador pode escolher para responder sua pergunta.
#	Speech é um array de strings. Foi separada assim para que o discurso inteiro pudesse ser mostrado sem que ultrapasasse o limite de caracteres que a tela que fizemos comporta.
#	Cada uma das respostas possui algumas chaves e valores:
#	-text, que é o texto que vai aparecer na opção clicável do jogador;
#	-redirect, um vetor que contém apenas false caso a seleção daquela resposta não redirecione para outra pergunta, ou true e outra question, que significa que, ao clicar naquela resposta, o jogador será redirecionado para a outra pergunta.
#	-restart, um booleano que representa se o diálogo deverá ser reiniciado (true) ou não (false)
#	-feedback, uma string com um feedback sobre a ação do jogador. Só existe caso redirect tenha valor false

var level_dialog = Dialogs.level_00_dialog

var current_speech #variável para o discurso que está sendo utilizado atualmente
var snippet #variável para controle das posições do vetor current_speech
var question #variável para armazenas a questão que está sendo utilizada atualmente

func _ready():
	question = "question_01" #Seta a questão 01 e posição 0
	snippet = 0

func _process(delta):
	#Modifica o diálogo e os players conforme o level
	if Global.level == 1:
		level_dialog = Dialogs.level_01_dialog
		$player_sprite.texture = load("res://assets/players/sandra/sandra_idle.png")
		$npc_sprite.texture = load("res://assets/npc/diana.png")
	elif Global.level == 2:
		level_dialog = Dialogs.level_02_dialog
		$player_sprite.texture = load("res://assets/players/sandra/sandra_idle.png")
		$npc_sprite.texture = load("res://assets/npc/idle_NPC4.png")
	elif Global.level == 3:
		level_dialog = Dialogs.level_03_dialog
		$player_sprite.texture = load("res://assets/players/ricardinho/ricardinho_idle.png")
		$npc_sprite.texture = load("res://assets/npc/idle_NPC2.png")
	elif Global.level == 4:
		level_dialog = Dialogs.level_04_dialog
		$player_sprite.texture = load("res://assets/players/ricardinho/ricardinho_idle.png")
		$npc_sprite.texture = load("res://assets/npc/idle_NPC3.png")
	elif Global.level == 5:
		level_dialog = Dialogs.level_05_dialog
		$player_sprite.texture = load("res://assets/players/claudemir/claudemir_idle.png")
		$npc_sprite.texture = load("res://assets/npc/idle_NPC1.png")
	elif Global.level == 6:
		level_dialog = Dialogs.level_06_dialog
		$player_sprite.texture = load("res://assets/players/claudemir/claudemir_idle.png")
		$npc_sprite.texture = load("res://assets/npc/idle_NPC5.png")
	#Se a caixa de feedback estiver ativa, ela precisa ser escondida antes de mostrar a caixa de diálogo.
	if !Global.is_feedback_box_active:
		$feedback_box.hide()
	else:
		$feedback_box.show()
		
	if !Global.is_dialog_active:
		get_node(".").hide()
	else:
		get_node(".").show()
	
	#atribui o discurso speech atual a variável current_speech
	current_speech = level_dialog[0][question].speech
	
	#Verifica se a posição (snippet) é maior que o tamanho do vetor. Caso seja, snippet recebe 0, pois significa que é hora de uma próxima pergunta
	if snippet + 1 > len(current_speech):
		snippet = 0
	
	#Verifica se o discurso está no momento de apenas exibir texto ou já é o discurso final e devem ser exibidas as opções de resposta para o usuário
	if snippet + 1 < len(current_speech):
		$TouchScreenButton.show()
		$ColorRect.hide()
		$ColorRect2.hide()
	else:
		$TouchScreenButton.hide()
		$ColorRect.show()
		$ColorRect2.show()

	#Como estamos na função _process, um jeito de garantir que o discurso seja exibido é verificar se o texto exibido na cena é igual ao snippet do discurso atual e, caso seja, a função retorna. Caso não, a cena recebe os dados do novo discurso
	if $npc_speech.text == current_speech[snippet]:
		return
	else:
		current_speech = level_dialog[0][question].speech
		
		$npc_speech.text = current_speech[snippet]
		$npc_speech/npc_tween.seek(0.0)
		$npc_speech/npc_tween.start()
		$ColorRect/Label.text = level_dialog[0][question].answer_01.text
		$ColorRect2/Label.text = level_dialog[0][question].answer_02.text

func _on_option_2_pressed():
	#Verifica se será necessário redirecionar para uma nova pergunta ou não. Caso não, ele incluir o feedback ao jogador e, caso seja necessário reiniciar o jogo de perguntas, ele irá restartar o diálogo (question_01 e snippet 0)
	if level_dialog[0][question].answer_02.redirect[0]:
		question = level_dialog[0][question].answer_02.redirect[1]
	else:
		$feedback_box/feedback.text = level_dialog[0][question].answer_02.feedback
		Global.is_feedback_box_active = true
		Global.can_go_to_next_level = true
		Global.has_dialog_finished = true
		
		if level_dialog[0][question].answer_02.restart:
			question = "question_01"
			snippet = 0
			Global.can_go_to_next_level = false
			Global.has_dialog_finished = false

func _on_option_1_pressed():
	#Faz as mesmas verificações descritas acima, mas para outra resposta
	if level_dialog[0][question].answer_01.redirect[0]:

		question = level_dialog[0][question].answer_01.redirect[1]	
	else:
		$feedback_box/feedback.text = level_dialog[0][question].answer_01.feedback
		Global.is_feedback_box_active = true
		Global.can_go_to_next_level = true
		Global.has_dialog_finished = true
		
		if level_dialog[0][question].answer_01.restart:
			question = "question_01"
			snippet = 0
			Global.can_go_to_next_level = false
			Global.has_dialog_finished = false

func _on_TouchScreenButton_pressed():
	#Verifica se a animação está ativa e, caso esteja, faz com que ela termine e exiba todo o texto.
	if $npc_speech/npc_tween.is_active():
		$npc_speech/npc_tween.seek(3.0)
	else:
		snippet += 1
