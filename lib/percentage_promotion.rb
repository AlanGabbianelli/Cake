class PercentagePromotion
  def initialize(minimum_amount, discount_percentage)
    @minimum_amount = minimum_amount
    @discount_percentage = discount_percentage
  end

  def apply(current_total)
    promo_applicable?(current_total) ? new_total(current_total) : current_total
  end

  private

  def promo_applicable?(current_total)
    current_total >= @minimum_amount
  end

  def new_total(current_total)
    current_total / 100 * (100 - @discount_percentage)
  end
end
