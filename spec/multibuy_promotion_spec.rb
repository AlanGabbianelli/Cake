require 'multibuy_promotion'

describe MultibuyPromotion do
  subject(:multibuy_promotion) { described_class.new }

  it 'is applied when item quantity is equal to required quantity' do
    expect(multibuy_promotion.apply({ 001 => 2 }, 18.50)).to eq(1.50)
  end

  it 'is applied when item quantity is greater than required quantity' do
    expect(multibuy_promotion.apply({ 001 => 3 }, 27.75)).to eq(2.25)
  end

  it 'is not applied when item quantity is less than required quantity' do
    expect(multibuy_promotion.apply({ 001 => 1 }, 9.25)).to eq(0.00)
  end
end
