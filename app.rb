require_relative 'customer'
require_relative 'product'
require_relative 'market'

products = []
customers = []
market = Market.new

def separator1
  puts '=' * 30
end

def separator2
  puts '-' * 30
end

loop do
  system('clear') || system('cls')
  puts "\n--- Bem-vindo à Skateshop ---\n"
  separator1
  puts 'Escolha uma opção (apenas números)'
  separator2
  puts '1. Cadastrar cliente'
  puts '2. Listar clientes'
  puts '3. Adicionar Crédito'
  puts '4. Cadastrar produto'
  puts '5. Listar produtos'
  puts '6. Comprar produto'
  puts '7. Histórico de compras'
  puts '8. Sair'
  separator2
  print 'Escolha uma opção: '
  option = gets.chomp.to_i

  case option
  when 1
    system('clear') || system('cls')
    puts 'Cadastro de Clientes'
    separator1
    print 'Digite o nome do cliente: '
    customer_name = gets.chomp.to_s
    separator2

    document = ''
    document_type = nil

    loop do
      puts 'Escolha o tipo de documento: '
      puts '1. CPF'
      puts '2. CNPJ'
      print 'Digite sua opção (apenas números): '
      option = gets.chomp.to_i
      separator2

      case option
      when 1
        print 'Digite o CPF (apenas números): '
        document = gets.chomp
        document_type = :cpf
      when 2
        print 'Digite o CNPJ (apenas números): '
        document = gets.chomp
        document_type = :cnpj
      else
        puts 'Opção inválida, tente novamente.'
        next
      end

      break if (document_type == :cpf && CPF.valid?(document)) || (document_type == :cnpj && CNPJ.valid?(document))

      separator1
      puts 'Documento inválido, tente novamente.'
      separator1
      sleep(3)
      system 'clear' || system('cls')
    end

    separator2
    print 'Digite o telefone (apenas números - EX: 11999999999): '
    customer_phone = gets.chomp
    separator1

    customers << Customer.new(customer_name, document, document_type, customer_phone)
    puts 'Cliente cadastrado com sucesso!'
    separator2
    sleep(0.5)
    puts 'Para visualizar as informações, acesse o tópico "Listar Clientes"'
    separator1
    sleep(4)

  when 2
    system('clear') || system('cls')
    puts 'Listar Clientes'
    separator1

    if customers.empty?
      puts 'Nenhum cliente cadastrado ainda.'
      separator2
      sleep(2)
      next
    end

    customers.each_with_index do |customer, index|
      puts "Cliente ##{index + 1}:"
      puts customer.show_information
      separator2
    end

    puts 'Pressione ENTER para sair'
    gets
  when 3
    system('clear') || system('cls')
    puts 'Adicionar Crédito'
    separator1

    if customers.empty?
      puts 'Nenhum cliente cadastrado ainda.'
      separator2
      sleep(2)
      next
    end

    loop do
      system('clear') || system('cls')

      puts 'Escolha o cliente para adicionar crédito:'
      separator2
      customers.each_with_index do |customer, index|
        puts "#{index + 1}. #{customer.name}"
      end

      separator1

      print 'Digite o número do cliente: '
      customer_index = gets.chomp.to_i - 1
      separator2
      if customer_index.negative? || customer_index >= customers.length
        puts 'Cliente não encontrado. Tente novamente.'
        separator2
        sleep(2)
      else
        customer = customers[customer_index]
        puts "Cliente selecionado: #{customer.name}"
        separator1

        print 'Digite o valor a ser adicionado: '
        credit_value = gets.chomp.to_f
        separator2
        if credit_value <= 0
          puts 'Valor inválido. O crédito deve ser maior que 0.'
          separator2
        else
          customer.add_credit(credit_value)
          puts "Crédito de R$#{'%.2f' % credit_value} adicionado com sucesso para #{customer.name}!"
          separator1
          sleep(2)
          break
        end
      end
    end

  when 4
    system('clear') || system('cls')
    puts 'Cadastrar Produto'
    separator1

    print 'Digite o nome do produto: '
    product_name = gets.chomp
    separator2

    product_price = 0
    loop do
      print 'Digite o preço do produto: '
      input = gets.chomp
      if input.match?(/^\d+(\.\d{1,2})?$/)
        product_price = input.to_f
        break if product_price.positive?

        puts 'Valor inválido. O preço deve ser maior que 0.'

      else
        puts 'Formato inválido. Use apenas números (EX: 49.90).'
      end
      separator2
    end

    separator2

    product_amount = 0
    loop do
      print 'Digite a quantidade do produto: '
      input = gets.chomp
      if input.match?(/^\d+$/)
        product_amount = input.to_i
        break if product_amount.positive?

        puts 'Valor inválido. A quantidade deve ser maior que 0.'

      else
        puts 'Formato inválido. Use apenas números inteiros (EX: 10).'
      end
      separator2
    end

    products << Product.new(product_name, product_price, product_amount)
    separator1
    puts 'Produto cadastrado com sucesso!'
    separator1
    sleep(2)

  when 5
    system('clear') || system('cls')
    puts 'Listar Produto'
    separator1

    if products.empty?
      puts 'Nenhum produto cadastrado ainda.'
      separator2
    end

    products.each_with_index do |product, index|
      puts "Produto ##{index + 1}:"
      puts product.show_info_product
      separator2
    end

    puts 'Pressione ENTER para sair'
    gets

  when 6
    system('clear') || system('cls')
    puts 'Comprar Produto'
    separator1
    sleep(1)

    if customers.empty? || products.empty?
      puts 'Necessário ter clientes e produtos cadastrados.'
      separator2
      sleep(2)
      next
    end

    customer = nil
    loop do
      system('clear') || system('cls')
      separator1
      puts 'Selecione o cliente:'
      customers.each_with_index do |c, index|
        puts "#{index + 1}. #{c.name} (Crédito: R$#{'%.2f' % c.credit})"
      end
      separator2
      print 'Digite o número do cliente: '
      customer_index = gets.chomp.to_i - 1

      if customer_index >= 0 && customer_index < customers.length
        customer = customers[customer_index]
        break
      else
        separator2
        puts 'Cliente inválido. Tente novamente.'
        separator2
        sleep(2)
      end
    end

    product = nil
    loop do
      system('clear') || system('cls')
      separator1
      puts 'Selecione o produto:'
      products.each_with_index do |p, index|
        puts "#{index + 1}. #{p.name} - R$#{'%.2f' % p.price} (Estoque: #{p.amount})"
      end
      separator2
      print 'Digite o número do produto: '
      product_index = gets.chomp.to_i - 1

      if product_index >= 0 && product_index < products.length
        product = products[product_index]
        break
      else
        separator2
        puts 'Produto inválido. Tente novamente.'
        separator2
        sleep(2)
      end
    end

    separator2
    market.buy_product(customer, product)
    separator1
    sleep(3)
  when 7
    system('clear') || system('cls')
    puts 'Histórico de Compras'
    separator1

    if market.purchase_history.empty?
      puts 'Nenhuma compra realizada ainda.'
    else
      market.purchase_history.each_with_index do |purchase, index|
        puts "##{index + 1} - Cliente: #{purchase[:customer]} | Produto: #{purchase[:product]} | Preço: R$#{purchase[:price]}"
      end
    end

    separator1
    puts 'Pressione ENTER para voltar ao menu'
    gets

  when 8
    system('clear') || system('cls')
    puts 'Saindo da Skateshop... Até logo!'
    sleep(2)
    system('clear') || system('cls')
    break
  else
    puts 'Opção inválida. Tente novamente.'
    sleep(1.5)
  end
end
