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
    puts "Quantidade?"
    quantity = gets.chomp.to_i
    cart << {product: product, quantity: quantity} # Adiciona ao cart o produto

  else
    # Mensagem de erro que o produto não existe
    puts "Produto não disponivel, procure outro ou quit"
  end
end# FIM DO LOOP

# [{:product=>"kiwi", :quantity=>3}, {:product=>"banana", :quantity=>2}, {:product=>"abacaxi", :quantity=>1}]

# Calcular o total dos produtos
total = 0
cart.each do |info|
  # Calcular o subtotal por produto X quantidade
  product = info[:product]
  quantity = info[:quantity]
  price = fruits[product]
  subtotal = price * quantity
  puts "Product: #{product} #{quantity} x #{price} = #{subtotal.round(2)}"
  total += subtotal
end

# Mostrar o total
puts "--------------------"
puts " Total R$ #{total}"
puts "--------------------"
