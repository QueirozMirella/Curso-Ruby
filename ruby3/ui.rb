def da_boas_vindas
	puts "Bem vindo ao jogo"
	puts "Qual o seu nome?"
	nome = gets.strip
	puts "\n\n"
	puts "Começaremos o jogo, #{nome}"
	nome
end

def desenha(mapa)
	puts mapa	
end

def pede_movimento
	puts "Para onde deseja ir?"
	movimento = gets.strip	
end