class Checkout

  def initialize
    @basket = []
  end

  def show_basket
    @basket
  end

  def scan(item)
    @basket << item
  end

  def total
    total = 0
    @basket.each { |item| total += item.price }
    total
  end
end
