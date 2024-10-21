fruits = {
  "banana" => {price: 1.2, availability: 5},
  "kiwi" => {price: 3.0, availability: 6},
  "manga" => {price: 5.0, availability: 2},
  "abacaxi" => {price: 10.01, availability: 8},
}

# Boas vindas
puts "--------------------"
puts " Welcome to Instacart"
puts "--------------------"

# cart é um array de hashs
# onde cada hash é do tipo {product: "abacaxi", quantity: 20}
cart = []

# LOOP
loop do
  # Mostrar os produtos com o respectivo preço e disponibilidade
  # info é hash do tipo {price: 1.2, availability: 5}
  fruits.each do |fruit, info|
    puts "#{fruit} a R$ #{info[:price]} Disponível #{info[:availability]}"
  end
  # Perguntar qual produto ele quer comprar
  puts "Escolha seu produto ou quit para encerrar:"
  product = gets.chomp

  # o produto for `quit` sai do loop
  break if product == "quit"

  # Verificar se o produto existe
  if fruits.key?(product)
    # Perguntar a quantidade
    puts "Quantidade?"
    quantity = gets.chomp.to_i


    # Determinar a disponibilidade:
    # product == "abacaxi"
    # fruits[product] == {price: 10.01, availability: 8}
    # fruits[product][:availability] == 8
    availability = fruits[product][:availability]

    # Verificar se a quantidade digitada é menor ou igual a que está disponível
    if quantity <= availability
      # Sim, temos a quantidade pedida
      cart << {product: product, quantity: quantity} # Adiciona ao cart o produto e quantidade
      # Remover da disponibilidade o que foi pedido
      fruits[product][:availability] -= quantity
    else
      # Não temos a quantidade solicitada
      puts "Estoque indisponível. Só temos #{availability} de #{product}"
    end
  else
    puts "Produto não disponivel, procure outro ou quit" # Mensagem de erro que o produto não existe
  end
end# FIM DO LOOP

# Exemplo de um cart:
# cart = [
#         {:product=>"kiwi", :quantity=>3},
#         {:product=>"banana", :quantity=>2},
#         {:product=>"abacaxi", :quantity=>1}
#        ]

# Calcular o total dos produtos
total = 0

puts "--------------------"
cart.each do |info|
  # info é um hash do tipo {:product=>"kiwi", :quantity=>3}
  product = info[:product] # => "kiwi"
  quantity = info[:quantity] # => 3

  # fruits["kiwi"] == {price: 3.0, availability: 6}
  # fruits["kiwi"][:price] == 3.0
  price = fruits[product][:price]

  subtotal = price * quantity

  puts "Product: #{product} #{quantity} x #{price} = #{subtotal.round(2)}"

  total += subtotal
end

# Mostrar o total

puts " Total R$ #{total}"
puts "--------------------"
