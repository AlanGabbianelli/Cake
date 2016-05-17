class Checkout
  attr_reader :basket

  def initialize
    @basket = []
    @total = 0.00
  end

  def scan(item)
    @basket << item
  end

  def total
    @basket.each { |item| @total += item.price }
    @total
  end
end
