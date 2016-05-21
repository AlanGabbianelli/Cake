require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new }
  let(:multibuy_promotion) { double(:promotion) }
  let(:percentage_promotion) { double(:promotion) }
  let(:lavander_heart) { double(:item) }
  let(:personalised_cufflinks) { double(:item) }

  context 'without items' do
    before do
      allow(multibuy_promotion).to receive(:apply).and_return(0.00)
      allow(percentage_promotion).to receive(:apply).and_return(0.00)
    end

    it 'starts with empty basket' do
      expect(checkout.basket).to be_empty
    end

    it 'starts with subtotal of 0.00' do
      expect(checkout.subtotal).to eq(0.00)
    end

    it 'starts with total of 0.00' do
      expect(checkout.total).to eq(0.00)
    end
  end

  context 'with items' do
    before do
      allow(lavander_heart).to receive(:price).and_return(9.25)
      allow(personalised_cufflinks).to receive(:price).and_return(45.00)
      allow(lavander_heart).to receive(:code).and_return(001)
      allow(personalised_cufflinks).to receive(:code).and_return(002)
    end

    context 'no promotions applicable' do
      before do
        allow(multibuy_promotion).to receive(:apply).and_return(0.00)
        allow(percentage_promotion).to receive(:apply).and_return(0.00)

        checkout.scan(lavander_heart)
        checkout.scan(personalised_cufflinks)
      end

      it "can update basket with items' codes and quantity" do
        expect(checkout.basket).to eq(001 => 1, 002 => 1)
      end

      it 'can calculate subtotal of basket' do
        expect(checkout.subtotal).to eq(54.25)
      end

      it 'can calculate total of basket and it matches subtotal' do
        expect(checkout.total).to eq(54.25)
      end
    end

    context 'multibuy promotion applicable' do
      before do
        allow(multibuy_promotion).to receive(:apply).and_return(1.50)
        allow(percentage_promotion).to receive(:apply).and_return(0.00)

        checkout.scan(lavander_heart)
        checkout.scan(lavander_heart)
      end

      it 'can calculate total of basket applying multibuy promotion' do
        expect(checkout.total).to eq(17.00)
      end
    end

    context 'percentage promotion applicable' do
      before do
        allow(multibuy_promotion).to receive(:apply).and_return(0.00)
        allow(percentage_promotion).to receive(:apply).and_return(9.00)

        checkout.scan(personalised_cufflinks)
        checkout.scan(personalised_cufflinks)
      end

      it 'can calculate total of basket applying percentage promotion' do
        expect(checkout.total).to eq(81.00)
      end
    end

    context 'both promotions applicable' do
      before do
        allow(multibuy_promotion).to receive(:apply).and_return(1.50)
        allow(percentage_promotion).to receive(:apply).and_return(10.70)

        checkout.scan(lavander_heart)
        checkout.scan(personalised_cufflinks)
        checkout.scan(lavander_heart)
        checkout.scan(personalised_cufflinks)
      end

      it 'can calculate total of basket applying both promotions' do
        expect(checkout.total).to eq(96.30)
      end
    end
  end
end
