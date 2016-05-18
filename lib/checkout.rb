class Checkout
  attr_reader :basket, :subtotal

  def initialize(promotions)
    @promotions = promotions
    @basket = Hash.new(0)
    @subtotal = 0.00
    @total = 0.00
  end

  def scan(item)
    update_basket(item)
    update_subtotal(item)
  end

  def total
    update_total
  end

  private

  def update_basket(item)
    @basket[item.code] += 1
  end

  def update_subtotal(item)
    @subtotal += item.price
  end

  def update_total
    current_total = @subtotal
    @promotions.each { |promo| current_total -= promo.apply(basket, current_total) }
    @total = current_total.round(2)
  end
end
