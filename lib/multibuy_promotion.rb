class MultibuyPromotion
  def initialize(item_code, required_quantity, discount_per_item)
    @item_code = item_code
    @required_quantity = required_quantity
    @discount_per_item = discount_per_item
  end

  def apply(order)
    promo_applicable?(order) ? applicable_discount(order) : 0.00
  end

  private

  def promo_applicable?(order)
    order[@item_code] >= @required_quantity
  end

  def applicable_discount(order)
    order[@item_code] * @discount_per_item
  end
end
