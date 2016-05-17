require 'checkout'

describe Checkout do
  subject(:co) { described_class.new }
  let(:lavander_heart) { double(:product) }
  let(:personalised_cufflinks) { double(:product) }

  it 'starts with an empty basket' do
    expect(co.basket).to be_empty
  end

  it 'starts with a total of 0.00' do
    expect(co.total).to eq(0.00)
  end

  it 'can add products to basket' do
    co.scan(lavander_heart)
    co.scan(personalised_cufflinks)
    expect(co.basket).to eq([lavander_heart, personalised_cufflinks])
  end

  it 'can calculate the total price of the basket' do
    allow(lavander_heart).to receive(:price).and_return(9.25)
    allow(personalised_cufflinks).to receive(:price).and_return(45.00)
    co.scan(lavander_heart)
    co.scan(personalised_cufflinks)
    expect(co.total).to eq(54.25)
  end

  xit 'has promotional rules' do
  end
end
