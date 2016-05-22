class PercentagePromotion
  def initialize(minimum_amount: 60, discount_percentage: 10)
    @minimum_amount = minimum_amount.to_d
    @discount_percentage = discount_percentage
  end

  def apply(basket, subtotal)
    promo_applicable?(subtotal) ? applicable_discount(subtotal) : 0
  end

  private

  def promo_applicable?(subtotal)
    subtotal >= @minimum_amount
  end

  def applicable_discount(subtotal)
    subtotal * @discount_percentage / 100
  end
end
