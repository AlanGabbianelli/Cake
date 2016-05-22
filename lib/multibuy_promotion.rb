class MultibuyPromotion
  def initialize(item_code: 001, required_quantity: 2, discount_per_item: 0.75)
    @item_code = item_code
    @required_quantity = required_quantity
    @discount_per_item = discount_per_item.to_d
  end

  def apply(basket, subtotal)
    promo_applicable?(basket) ? applicable_discount(basket) : 0
  end

  private

  def promo_applicable?(basket)
    basket[@item_code] >= @required_quantity
  end

  def applicable_discount(basket)
    basket[@item_code] * @discount_per_item
  end
end
