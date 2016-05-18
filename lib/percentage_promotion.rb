class PercentagePromotion
  def initialize(minimum_amount, discount_percentage)
    @minimum_amount = minimum_amount
    @discount_percentage = discount_percentage
  end

  def apply(current_total)
    promo_applicable?(current_total) ? applicable_discount(current_total) : 0.00
  end

  private

  def promo_applicable?(current_total)
    current_total >= @minimum_amount
  end

  def applicable_discount(current_total)
    current_total / 100.00 * @discount_percentage
  end
end
