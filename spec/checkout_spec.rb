require 'checkout'

describe Checkout do
  subject(:co) { described_class.new }
  let(:lavander_heart) { double(:item) }
  let(:personalised_cufflinks) { double(:item) }

  context 'without items' do
    it 'starts with an empty basket' do
      expect(co.basket).to be_empty
    end

    it 'starts with an empty order' do
      expect(co.order).to be_empty
    end

    it 'starts with a subtotal of 0.00' do
      expect(co.subtotal).to eq(0.00)
    end
  end

  context 'with items' do
    before do
      allow(lavander_heart).to receive(:price).and_return(9.25)
      allow(personalised_cufflinks).to receive(:price).and_return(45.00)
      allow(lavander_heart).to receive(:code).and_return(001)
      allow(personalised_cufflinks).to receive(:code).and_return(002)
      co.scan(lavander_heart)
      co.scan(personalised_cufflinks)
    end

    it 'can add items to basket' do
      expect(co.basket).to eq([lavander_heart, personalised_cufflinks])
    end

    it 'can update order with items\' codes and quantity' do
      expect(co.order).to eq(001 => 1, 002 => 1)
    end

    it 'can calculate the subtotal of the basket' do
      expect(co.subtotal).to eq(54.25)
    end
  end
end
