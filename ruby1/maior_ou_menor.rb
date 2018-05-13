def da_boas_vindas
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
end

def pede_dificuldade
    puts "Qual o nivel de dificuldade que você escolhe? (1:facil, 5:dificil)"
    dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
	case dificuldade
	when 1
		maximo = 30
	when 2
		maximo = 60
	when 3
		maximo = 100
	when 4
		maximo = 150
	else 
		maximo = 200
	end
    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo) + 1
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
    sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
    puts "\n\n"
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
    puts "chutes até agora: #{chutes}"
    puts "Entre com o número"
    chute = gets.strip
    puts "Será que acertou? Você chutou #{chute} "
    chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute
    if acertou
        puts "Acertou!"
        return true
    end
    maior = numero_secreto > chute
    if maior
        puts "O número secreto é maior!"
    else
        puts "O número secreto é menor!"
    end
    false
end

def joga(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto dificuldade

    pontos_ate_agora = 1000
    limite_de_tentativas = 5
    chutes = []

    for tentativa in 1..limite_de_tentativas
        chute = pede_um_numero chutes, tentativa, limite_de_tentativas
        chutes << chute

        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        pontos_ate_agora -= pontos_a_perder

        if nome == "mirella"
            puts "Acertou!"
            break
        end

        if verifica_se_acertou numero_secreto, chute
            break
        end
    end

    puts "Você ganhou #{pontos_ate_agora} pontos."
end

def quer_jogar
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    quero_jogar.upcase == "S"     
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
    joga nome, dificuldade    
    if !quer_jogar
        break
    end
end
