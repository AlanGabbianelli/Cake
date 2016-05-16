require 'product'

describe Product do
  subject(:lavander_heart) { described_class.new(001, 'Lavander heart', 9.25) }

  it 'has a code' do
    expect(lavander_heart.code).to eq(001)
  end

  it 'has a name' do
    expect(lavander_heart.name).to eq('Lavander heart')
  end

  it 'has a price' do
    expect(lavander_heart.price).to eq(9.25)
  end
end
