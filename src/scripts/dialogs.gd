extends Node

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

var level_00_dialog = [
	{
		"question_01": {
			"speech": ["Esse é um exemplo de como os diálogos acontecerão."],
			"answer_01": {
				"text": "Ok!",
				"redirect": [false],
				"restart": false,
				"feedback": "Continue jogando V.talícios!"
			},
			"answer_02": {
				"text": "Entendi",
				"redirect": [false],
				"restart": false,
				"feedback": "Continue jogando V.talícios!"
			}
		}
	}
]

var level_01_dialog = [
	{
		"question_01": {
			"speech": ["Olá, Sandra. Fico feliz que tenha vindo hoje!", "Queremos chegar com nosso plano de fibra em uma cidade do interior e a V.tal pode nos ajudar com isso!", "Vamos jantar e aproveitamos para discutir sobre isso?"],
			"answer_01": {
				"text": "Não",
				"redirect": [false],
				"restart": true,
				"feedback": "Você precisa ir ao jantar para conseguir fechar o acordo! \n \n \n Tente novamente!"
			},
			"answer_02": {
				"text": "Sim",
				"redirect": [true, "question_02"],
			}
		},
		"question_02": {
			"speech": ["Pensei em irmos ao Fasano. O que acha?"],
			"answer_01": {
				"text": "Acho melhor um lugar mais barato",
				"redirect": [true, "question_04"],
			},
			"answer_02": {
				"text": "Eu adoraria!",
				"redirect": [true, "question_03"],
			}
		},
		"question_03": {
			"speech": ["Sua conta ficou R$ 1890,00. Pode deixar que eu pago!"],
			"answer_01": {
				"text": "Obrigado pela gentileza!",
				"redirect": [false],
				"restart": true,
				"feedback": "Apesar de parecer uma ação gentil, Vitória pode usar essa atitude contra você no futuro. Da próxima vez, tente pagar sua conta ou convide-a para um local mais barato. \n \n \n Tente novamente!"
			},
			"answer_02": {
				"text": "Cada um paga o seu",
				"redirect": [false],
				"restart": false,
				"feedback": "Parabéns! Você recebeu uma oportunidade tentadora, mas ao não aceitar que Vitória pagasse sua conta, você demonstrou conhecimento sobre o código de conduta e ética da V.tal não permitir o recebimento de brindes acima de US$ 100.00. Além disso, você conseguiu fechar o contrato com uma nova parceria para a V.tal! \n \n \n Siga para o próximo andar!"
			}
		},
		"question_04": {
			"speech": ["Sua conta ficou R$ 50,00. Pode deixar que eu pago!"],
			"answer_01": {
				"text": "Obrigado pela gentileza!",
				"redirect": [false],
				"restart": false,
				"feedback": "Parabéns! Você conseguiu fechar o contrato de parceria com a empresa de Vitória e não descumpriu nenhum item do código de conduta e ética da V.tal! Lembre-se que não é errado receber brindes ou presentes com baixo valor (menores que US$ 100). \n \n \n Siga para o próximo andar!"
			},
			"answer_02": {
				"text": "Cada um paga o seu",
				"redirect": [false],
				"restart": false,
				"feedback": "Parabéns! Você conseguiu fechar o contrato de parceria com a empresa de Vitória e não descumpriu nenhum item do código de conduta e ética da V.tal! \n \n \n Siga para o próximo andar!"
			}
		}
	}
]

var level_02_dialog = [
	{
		"question_01": {
			"speech": ["Olá, Sandra. Tudo bem?", "O governo quer fazer uma campanha para levar fibra óptica para novas regiões do Brasil.", "Pensei que a Vtal poderia ajudar com isso, estamos dispostos a negociar até mesmo um valor de comissão para você caso consiga essa parceria."],
			"answer_01": {
				"text": "Aceitar oferta",
				"redirect": [false],
				"restart": true,
				"feedback": "Aceitar a oferta, sem considerar o posicionamento do compliance da V.tal, não é a melhor opção. \n \n \n Tente novamente!"
			},
			"answer_02": {
				"text": "Recusar oferta e denunciar agente",
				"redirect": [true, "question_02"],
			}
		},
		"question_02": {
			"speech": ["Se você aceitar, posso te dar informações privilegiadas sobre aquele licenciamento que você requereu em nome da empresa.", "Tem certeza que quer recusar a minha oferta?"],
			"answer_01": {
				"text": "Recusar mesmo assim",
				"redirect": [false],
				"restart": false,
				"feedback": "Parabéns! Você demonstrou saber se relacionar com agentes públicos de acordo com o código de conduta e ética da V.tal. \n \n \n Avance para o próximo andar!",
			},
			"answer_02": {
				"text": "Pensando bem... Eu aceito",
				"redirect": [false],
				"restart": true,
				"feedback": "Mesmo que você conseguisse obter alguma vantagem ao aceitar a oferta do agente público, o código de conduta e ética da V.tal requer cuidado ao interagir com esse público. \n \n \n Tente novamente!"
			}
		}
	}
]

var level_03_dialog = [
	{
		"question_01": {
			"speech": ["Olá, Ricardinho!", "Fico feliz que a V.tal tenha fechado uma parceria com a gente na semana passada!", "Como forma de agradecimento, te trouxe um presente."],
			"answer_01": {
				"text": "Aceitar",
				"redirect": [false],
				"restart": true,
				"feedback": "Você deveria perguntar mais informações sobre o presente antes de considerar aceitá-lo sem comunicar o compliance. \n \n \n Tente novamente!"
			},
			"answer_02": {
				"text": "Qual o valor do produto?",
				"redirect": [true, "question_02"],
			}
		},
		"question_02": {
			"speech": ["Ele custa US$ 105, mas não se preocupe com o valor, o importante é comemorar!"],
			"answer_01": {
				"text": "Ficar com o presente",
				"redirect": [false],
				"restart": true,
				"feedback": "Lembre-se que você não pode aceitar brindes e/ou presentes com valores superiores a US$ 100. Nesse caso, mesmo que a diferença fosse pouca (apenas US$5), você deveria levar o produto ao compliance para decidir o que fazer. \n \n \n Tente novamente!",
			},
			"answer_02": {
				"text": "Levar para o compliance",
				"redirect": [false],
				"restart": false,
				"feedback": "Boa! Ao recusar ficar para você mesmo com um brinde superior a US$ 100, você demonstrou compreender sobre as regras de compliance da V.tal. \n \n \n Avance para o próximo andar!"
			}
		}
	}
]

var level_04_dialog = [
	{
		"question_01": {
			"speech": ["Ricardo! Fico muito feliz em te ver!", "Queria te agradecer por seus serviços e representar tão bem a V.tal na nossa empresa.", "Aqui tem 2 ingressos para o Lollapalooza para você ir com quem quiser."],
			"answer_01": {
				"text": "Muito obrigado",
				"redirect": [false],
				"restart": true,
				"feedback": "O ingresso para esse festival de música é superior a US$ 100. Lembre-se que esse é o valor limite para aceitar brindes. \n \n \n Tente novamente!"
			},
			"answer_02": {
				"text": "Acho melhor não aceitar",
				"redirect": [true, "question_02"],
			}
		},
		"question_02": {
			"speech": ["Sério? Você pode levar alguém da V.tal junto com você."],
			"answer_01": {
				"text": "Agradeço, mas não posso aceitar",
				"redirect": [false],
				"restart": false,
				"feedback": "Isso aí! Tenha sempre em mente o valor limite para aceitar brindes (US$ 100). \n \n \n Avance para o próximo andar!",
			},
			"answer_02": {
				"text": "Sendo assim, fico com os ingressos",
				"redirect": [false],
				"restart": true,
				"feedback": "Mesmo que você leve alguém da empresa com você, o aceite de brindes superiores a US$ não é permitido. Você poderia recusar a oferta dos ingressos ou pedir que ele os enviasse diretamente para o compliance da empresa, que decidiria o que fazer. \n \n \n Tente novamente!"
			}
		}
	}
]

var level_05_dialog = [
	{
		"question_01": {
			"speech": ["Olá, Claudemir! Você que vai instalar a fibra óptica lá em casa, não é?", "Será que você conseguiria fazer um desconto camarada no meu plano?"],
			"answer_01": {
				"text": "Claro que não",
				"redirect": [true, "question_02"]
			},
			"answer_02": {
				"text": "Pode deixar",
				"redirect": [false],
				"restart": true,
				"feedback": "Você não pode fornecer descontos além do que foi planejado entre a empresa e o cliente. Lembre-se que você está representando uma empresa ao fazer a instalação do ponto de fibra óptica e tomar uma atitude dessas é completamente antiético.\n \n \n Tente novamente!"
			}
		},
		"question_02": {
			"speech": ["Pow, mas eu fiquei sabendo que seu filho quer estudar na mesma faculdade que o meu estuda...", "Se você conseguir um desconto na fibra pra mim, talvez eu possa ajudar o seu filho."],
			"answer_01": {
				"text": "Eu adoraria!",
				"redirect": [false],
				"restart": true,
				"feedback": "Você precisa saber lidar com conflitos de interesse. Por mais que ele tenha te oferecido uma boa proposta, é necessário entender que ter esse comportamento vai contra o código de conduta e ética da V.tal. \n \n \n Tente novamente!"
			},
			"answer_02": {
				"text": "Obrigado, mas não!",
				"redirect": [false],
				"restart": false,
				"feedback": "Muito bem! Você soube lidar muito bem com um conflito de interesses. \n \n \n Vá para o próximo andar!"
			}
		}
	}
]

var level_06_dialog = [
	{
		"question_01": {
			"speech": ["Bom dia, Claudemir!", "Vi que você precisava instalar um ponto de fibra na casa de Beltrano", "Se você NÃO for fazer o serviço, eu te daria uma bonificação bem alta."],
			"answer_01": {
				"text": "Opa, que coisa boa!",
				"redirect": [false],
				"restart": true,
				"feedback": "Você não consegue entender qual a intenção dessa pessoa ao fazer essa oferta. Lembre-se que você pode estar representando uma empresa terceira, que não a V.tal. Isso pode se voltar contra você no futuro. \n \n \n Tente novamente!"
			},
			"answer_02": {
				"text": "Por que eu faria isso?",
				"redirect": [true, "question_02"]
			}
		},
		"question_02": {
			"speech": ["Eu não gosto muito desse cliente, sabe?", "Além disso, você poderia utilizar o dinheiro para viajar com toda a sua família, por exemplo."],
			"answer_01": {
				"text": "Não posso fazer isso",
				"redirect": [false],
				"restart": false,
				"feedback": "Você conseguiu demonstrar muito bem conhecer o código de conduta e ética da V.tal sobre brindes e até mesmo conflitos de interesse. \n \n \n Vá para o último andar"
			},
			"answer_02": {
				"text": "Hum... Tudo bem",
				"redirect": [false],
				"restart": true,
				"feedback": "Você não consegue entender qual a intenção dessa pessoa ao fazer essa oferta. Lembre-se que você pode estar representando uma empresa terceira, que não a V.tal. Isso pode se voltar contra você no futuro. \n \n \n Tente novamente!"
			}
		}
	}
]
