require 'percentage_promotion'

describe PercentagePromotion do
  subject(:percentage_promotion) { described_class.new(60.0, 10.0) }

  it 'is applied when total is equal to minimum amount' do
    expect(percentage_promotion.apply(60.0)).to eq(54.0)
  end

  it 'is applied when total is greater than minimum amount' do
    expect(percentage_promotion.apply(100.0)).to eq(90.0)
  end

  it 'is not applied when total is less than minimum amount' do
    expect(percentage_promotion.apply(59.99)).to eq(59.99)
  end
end
