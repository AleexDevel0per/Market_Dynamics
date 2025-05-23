require 'cpf_cnpj'

class Customer
  attr_accessor :name, :document, :phone, :credit, :document_type

  def initialize(name, document, document_type, phone)
    @name = name
    @document = document
    @document_type = document_type.to_sym
    @phone = phone
    @credit = 0
  end

  def add_credit(value)
    @credit += value
  end

  def valid_document?
    case @document_type
    when :cpf
      CPF.valid?(@document)
    when :cnpj
      CNPJ.valid?(@document)
    else
      false
    end
  end

  def formatted_document
    case @document_type
    when :cpf
      CPF.format(@document)
    when :cnpj
      CNPJ.format(@document)
    else
      @document
    end
  end

  def format_phone
    phone = @phone.gsub(/\D/, '')
    if phone.length == 11
      "(#{phone[0..1]}) #{phone[2..6]}-#{phone[7..10]}"
    elsif phone.length == 10
      "(#{phone[0..1]}) #{phone[2..5]}-#{phone[6..9]}"
    else
      @phone
    end
  end

  def format_credit
    int, decimal = format('%.2f', @credit).split('.')
    int_with_separator = int.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
    "#{int_with_separator},#{decimal}"
  end

  def deduct_credit(amount)
    @credit -= amount
  end

  def show_information
    <<~INFO
      Nome: #{@name}
      #{@document_type.to_s.upcase}: #{formatted_document}
      Telefone: #{format_phone}
      Crédito: R$ #{format_credit}
    INFO
  end
end
