require_relative 'products'
require_relative 'promotional_rules'

class Checkout

  attr_reader :total, :basket, :receipt

  def initialize(promotional_rules = PromotionalRules.new, products = Products.new)
    @basket = []
    @products = products
    @total = 0
    @receipt = ''
  end

  def items_available
    @products.items
  end

  def scan(item_number)
    add_to_basket(item_number)
  end

  def finish_ordering
    print_receipt
  end

  private

  def print_receipt
    @basket.each do |x|
      message = "1 #{x[0]}, "
      @receipt += message
    end
    @receipt += "The final total is £#{@total}"
  end

  def add_to_basket(item)
    item_scanned = items_available.fetch(item)
    add_to_total(item_scanned[1])
    @basket.push(item_scanned)
  end

  def add_to_total(price)
    @total+= price
  end

end
