require 'item'
require 'multibuy_promotion'
require 'percentage_promotion'
require 'checkout'

describe 'Integration Spec' do
  lavander_heart = Item.new
  personalised_cufflinks = Item.new(code: 002, name: 'Personalised cufflinks', price: 45.00)
  kids_t_shirt = Item.new(code: 003, name: 'Kids T-shirt', price: 19.95)

  checkout_1 = Checkout.new
  checkout_2 = Checkout.new
  checkout_3 = Checkout.new

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
