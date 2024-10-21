fruits = {
"banana" => 1.20,
"kiwi" => 3.0,
"manga" => 5.0,
"abacaxi" => 10.01
}

# Boas vindas
puts "--------------------"
puts " Welcome to Instacart"
puts "--------------------"

# Mostrar os produtos com o respectivo preço
 fruits.each do |fruit, price|
  puts "#{fruit} a R$ #{price}"

end

# cart é um array de hashs
# onde cada hash é do tipo {product: "abacaxi", quantity: 20}
cart = []

# LOOP
loop do
  # Perguntar qual produto ele quer comprar
  puts "Escolha seu produto  "
  product = gets.chomp

  # o produto for `quit` sai do loop
  break if product == "quit"

  # Verificar se o produto existe
  if fruits.key?(product)
    # Perguntar a quantidade

    cart << {product: "abacaxi", quantity: 20} # Adiciona ao cart o produto

  else
    # Mensagem de erro que o produto não existe
    puts "Produto não disponivel, procure outro ou quit"
  end
end# FIM DO LOOP

# Calcular o total dos produtos
total = 0
cart.each do |product|
  # Calcular o subtotal por produto X quantidade
  price = fruits[product]
  total += price
end

# Mostrar o total
puts "--------------------"
puts " Total R$ #{total}"
puts "--------------------"
