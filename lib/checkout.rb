class Checkout
  attr_reader :basket, :order, :total

  def initialize
    @basket = []
    @order = Hash.new(0)
    @total = 0.00
  end

  def scan(item)
    put_into_basket(item)
    update_order(item)
    update_total(item)
  end

  private

  def put_into_basket(item)
    @basket << item
  end

  def update_order(item)
    @order[item.code] += 1
  end

  def update_total(item)
    @total += item.price
  end
end
