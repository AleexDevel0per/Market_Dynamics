class Market
  attr_reader :purchase_history

  def initialize
    @purchase_history = []
  end

  def buy_product(customer, product)
    if product.amount <= 0
      puts 'Produto fora de estoque.'
      return false
    end

    if customer.credit < product.price
      puts 'Crédito insuficiente para compra.'
      return false
    end

    customer.deduct_credit(product.price)
    product.decrease_amount

    @purchase_history << {
      customer: customer.name,
      product: product.name,
      price: product.price
    }

    puts "Compra realizada com sucesso! #{customer.name} comprou #{product.name} por R$#{'%.2f' % product.price}."
    true
  end
end
