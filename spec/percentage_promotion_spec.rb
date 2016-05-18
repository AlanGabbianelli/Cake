require 'percentage_promotion'

describe PercentagePromotion do
  subject(:percentage_promotion) { described_class.new(10, 60.0) }

  it 'is applied when the total is equal to the minimum amount' do
    expect(percentage_promotion.apply(60.0)).to eq(54.0)
  end

  it 'is applied when the total is greater than the minimum amount' do
    expect(percentage_promotion.apply(100.0)).to eq(90.0)
  end

  it 'is not applied when the total is less than the minimum amount' do
    expect(percentage_promotion.apply(59.99)).to eq(59.99)
  end
end
