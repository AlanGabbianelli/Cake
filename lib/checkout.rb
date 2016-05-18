class Checkout
  attr_reader :basket, :subtotal

  def initialize
    @basket = Hash.new(0)
    @subtotal = 0.00
  end

  def scan(item)
    update_basket(item)
    update_subtotal(item)
  end

  private

  def update_basket(item)
    @basket[item.code] += 1
  end

  def update_subtotal(item)
    @subtotal += item.price
  end
end
