class PercentagePromotion
  def initialize(minimum_amount: 60.00, discount_percentage: 10.00)
    @minimum_amount = minimum_amount
    @discount_percentage = discount_percentage
  end

  def apply(basket, subtotal)
    promo_applicable?(subtotal) ? applicable_discount(subtotal) : 0.00
  end

  private

  def promo_applicable?(subtotal)
    subtotal >= @minimum_amount
  end

  def applicable_discount(subtotal)
    subtotal / 100.00 * @discount_percentage
  end
end
