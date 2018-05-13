require_relative "produto"
require_relative "impresso"

class Revista < Produto
	include Impresso

	def initialize(titulo, preco, ano_lancamento, possui_reimpressao, numero, editora)
		super(titulo, preco, ano_lancamento, editora)
		@numero = numero
		@possui_reimpressao = possui_reimpressao

	end

	def matches?(query)
		["revista", "impresso"].include?(query)
	end


	def possui_reimpressao?
    	@possui_reimpressao
  	end

end
