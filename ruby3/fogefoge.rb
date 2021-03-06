require_relative 'ui'

def le_mapa(numero)
	arquivo = "mapa#{numero}.txt"
	texto = File.read arquivo
	mapa = texto.split "\n"	
end

def encontra_jogador(mapa)
	caracter_do_heroi = "H"
	mapa.each_with_index do |linha_atual, linha|
		coluna_do_heroi = linha_atual.index caracter_do_heroi
		if coluna_do_heroi
			return [linha, coluna_do_heroi]		
		end
	end
	#não achei
end

def calcula_nova_posicao(heroi, direcao)
	heroi = heroi.dup
	movimentos = {
		"W" => [-1, 0],
		"S" => [+1, 0],
		"A" => [0, -1]
		"D" => [0, +1]
	}
	movimento = movimentos[direcao]
	heroi[0] += movimento[0]
	heroi[1] += movimento[1]
	heroi
end

def posicao_valida?(mapa, posicao)

	linhas = mapa.size
	colunas = mapa[0].size
	estourou_linhas = posicao[0] < 0 || posicao[0] >= mapa.size
	estourou_colunas = posicao[1] < 0 || posicao[1] >= mapa[0].size

	if estourou_linhas || estourou_colunas
		return false
	end

	valor_atual = mapa[posicao[0]][posicao[1]]
	if valor_atual == "X" || valor_atual == "F"
		return false
	end
	true
end

def move_fantasma(mapa, linha, coluna)
	posicao = [linha, coluna + 1]
	if posicao_valida? mapa, posicao
		mapa[linha][coluna] = " "
		mapa[posicao[0]][posicao[1]] = "F"
	end	
end

def move_fantasmas(mapa)
	caracter_do_fantasma = "F"
	mapa.each_with_index do |linha_atual, linha|
		linha_atual.chars.each_with_index do |caracter_atual, coluna|
			eh_fantasma = caracter_atual == caracter_do_fantasma
			if eh_fantasma
				move_fantasma mapa, linha, coluna
			end
		end
	end
end

def joga(nome)
	mapa = le_mapa 2

	while true
		desenha mapa
		direcao = pede_movimento
		heroi = encontra_jogador mapa
		nova_posicao = calcula_nova_posicao heroi, direcao
		if !posicao_valida? mapa, nova_posicao
			next
		end
		mapa[heroi[0]][heroi[1]] = " "
		mapa[nova_posicao[0]][nova_posicao[1]] = "H"

		move_fantasmas mapa
	end
end

def inicia_fogefoge
	nome = da_boas_vindas
	joga nome
end