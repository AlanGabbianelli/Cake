class MultibuyPromotion
  def initialize(item_code, required_quantity, discount_per_item)
    @item_code = item_code
    @required_quantity = required_quantity
    @discount_per_item = discount_per_item
  end

  def apply(basket, subtotal)
    promo_applicable?(basket) ? applicable_discount(basket) : 0.00
  end

  private

  def promo_applicable?(basket)
    basket[@item_code] >= @required_quantity
  end

  def applicable_discount(basket)
    basket[@item_code] * @discount_per_item
  end
end
