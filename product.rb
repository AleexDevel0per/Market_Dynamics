class Product
  attr_accessor :name, :price, :amount

  def initialize(name, price, amount)
    @name = name
    @price = price
    @amount = amount
  end

  def format_value
    int, decimal = format('%.2f', @price).split('.')
    int_with_separator = int.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
    "#{int_with_separator},#{decimal}"
  end

  def decrease_amount
    @amount -= 1
  end

  def show_info_product
    puts "Nome: #{@name}"
    puts "Preço: R$#{format_value}"
    puts "Quantidade: #{@amount}"
  end
end
