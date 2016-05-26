class Checkout # :nodoc:
  attr_reader :basket, :subtotal

  def initialize(promotions: [MultibuyPromotion.new, PercentagePromotion.new])
    @promotions = promotions
    @basket = Hash.new(0)
    @subtotal = 0
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
    total = @subtotal
    @promotions.each { |promotion| total -= promotion.apply(basket, total) }
    total.round(2).to_f
  end
end
