require 'item'

describe Item do
  subject(:lavander_heart) { described_class.new }

  it "has a code and it is '001' by default" do
    expect(lavander_heart.code).to eq(001)
  end

  it "has a name and it is 'Lavander heart' by default" do
    expect(lavander_heart.name).to eq('Lavander heart')
  end

  it "has a price and it is '9.25' by default" do
    expect(lavander_heart.price).to eq(9.25)
  end
end
