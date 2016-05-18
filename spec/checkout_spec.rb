require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new }
  let(:lavander_heart) { double(:item) }
  let(:personalised_cufflinks) { double(:item) }

  context 'without items' do
    it 'starts with an empty basket' do
      expect(checkout.basket).to be_empty
    end

    it 'starts with an empty order' do
      expect(checkout.order).to be_empty
    end

    it 'starts with a subtotal of 0.00' do
      expect(checkout.subtotal).to eq(0.00)
    end
  end

  context 'with items' do
    before do
      allow(lavander_heart).to receive(:price).and_return(9.25)
      allow(personalised_cufflinks).to receive(:price).and_return(45.00)
      allow(lavander_heart).to receive(:code).and_return(001)
      allow(personalised_cufflinks).to receive(:code).and_return(002)
      checkout.scan(lavander_heart)
      checkout.scan(personalised_cufflinks)
    end

    it 'can add items to basket' do
      expect(checkout.basket).to eq([lavander_heart, personalised_cufflinks])
    end

    it 'can update order with items\' codes and quantity' do
      expect(checkout.order).to eq(001 => 1, 002 => 1)
    end

    it 'can calculate the subtotal of the basket' do
      expect(checkout.subtotal).to eq(54.25)
    end
  end
end
