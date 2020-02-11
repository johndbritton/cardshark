# frozen_string_literal: true

require 'cardshark/card'

RSpec.describe Cardshark::Card do
  let(:rank) { Class.new(Cardshark::Dimension) }
  let(:suit) { Class.new(Cardshark::Dimension) }

  let(:ace) { rank.new(:ace) }
  let(:spades) { suit.new(:spades) }
  let(:clubs) { suit.new(:clubs) }

  describe '::new' do
    context 'invalid arguments' do
      context 'no arguments' do
        it 'raises an ArgumentError' do
          expect { described_class.new }.to raise_error(ArgumentError)
        end
      end

      context 'invalid argument type' do
        it 'raises an ArgumentError' do
          expect { described_class.new('invalid-arguments') }
            .to raise_error(ArgumentError)
        end
      end

      context 'more than one argument of the same dimension' do
        it 'raises an ArgumentError' do
          expect { described_class.new(spades, clubs) }
            .to raise_error(ArgumentError)
        end
      end
    end

    context 'valid arguments' do
      it 'does not raise an error' do
        expect { described_class.new(ace, spades) }.not_to raise_error
      end
    end
  end

  describe '#dimensions' do
    let(:card) { described_class.new(ace, spades) }

    before do
      @result = card.dimensions
    end

    it 'returns an Array' do
      expect(@result).to be_an(Array)
    end

    it 'contains one entry for each type of dimension' do
      expect(@result.count).to eq(2)
    end

    it 'contains a symbol for the first dimension' do
      expect(@result).to include(rank.id)
    end

    it 'contains a symbol for the second dimension' do
      expect(@result).to include(suit.id)
    end
  end

  describe 'dynamic dimension methods' do
    let(:card) { described_class.new(ace, spades) }

    it 'has a method for the first dimension' do
      expect(card.respond_to?(suit.id)).to eq(true)
    end

    it 'has a method for the second dimension' do
      expect(card.respond_to?(rank.id)).to eq(true)
    end

    it 'returns the correct value for the first dimension' do
      expect(card.send(suit.id)).to eq(spades)
    end

    it 'returns the correct value for the second dimension' do
      expect(card.send(rank.id)).to eq(ace)
    end
  end
end
