require 'item'
require 'multibuy_promotion'
require 'percentage_promotion'
require 'checkout'

describe 'Integration Spec' do
  lavander_heart = Item.new(001, 'Lavender heart', 9.25)
  personalised_cufflinks = Item.new(002, 'Personalised cufflinks', 45.00)
  kids_t_shirt = Item.new(003, 'Kids T-shirt', 19.95)

  multibuy_promotion = MultibuyPromotion.new(001, 2, 0.75)
  percentage_promotion = PercentagePromotion.new(60.00, 10.00)

  checkout_1 = Checkout.new([multibuy_promotion, percentage_promotion])
  checkout_2 = Checkout.new([multibuy_promotion, percentage_promotion])
  checkout_3 = Checkout.new([multibuy_promotion, percentage_promotion])

  it 'applies percentage promotion' do
    checkout_1.scan(lavander_heart)
    checkout_1.scan(personalised_cufflinks)
    checkout_1.scan(kids_t_shirt)
    expect(checkout_1.total).to eq(66.78)
  end

  it 'applies multibuy promotion' do
    checkout_2.scan(lavander_heart)
    checkout_2.scan(kids_t_shirt)
    checkout_2.scan(lavander_heart)
    expect(checkout_2.total).to eq(36.95)
  end

  it 'applies both promotions in the right order' do
    checkout_3.scan(lavander_heart)
    checkout_3.scan(personalised_cufflinks)
    checkout_3.scan(lavander_heart)
    checkout_3.scan(kids_t_shirt)
    expect(checkout_3.total).to eq(73.76)
  end
end
