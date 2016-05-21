require 'percentage_promotion'

describe PercentagePromotion do
  subject(:percentage_promotion) { described_class.new }

  it 'is applied when total is equal to minimum amount' do
    expect(percentage_promotion.apply({}, 60.00)).to eq(6.00)
  end

  it 'is applied when total is greater than minimum amount' do
    expect(percentage_promotion.apply({}, 61.00)).to eq(6.10)
  end

  it 'is not applied when total is less than minimum amount' do
    expect(percentage_promotion.apply({}, 59.99)).to eq(0.00)
  end
end
