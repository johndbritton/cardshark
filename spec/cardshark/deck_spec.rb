# frozen_string_literal: true

require 'cardshark/card'
require 'cardshark/deck'

RSpec.describe Cardshark::Deck do
  context 'class methods' do
    describe '::new' do
      context 'invalid arguments' do
        context 'no arguments' do
          it 'raises an ArgumentError' do
            expect { described_class.new }.to raise_error(ArgumentError)
          end
        end

        context 'invalid arguments' do
          it 'raises an ArgumentError' do
            expect { described_class.new('invalid-arguments') }
              .to raise_error(ArgumentError)
          end
        end

        context 'valid arguments' do
          it 'does not raise an error' do
            expect { described_class.new {} }.not_to raise_error
          end
        end
      end
    end
  end

  context 'instance methods' do
    let(:suit)    { Class.new(Cardshark::Dimension) }
    let!(:spades) { suit.new(:spades) }
    let!(:hearts) { suit.new(:hearts) }

    let(:rank)   { Class.new(Cardshark::Dimension) }
    let!(:king)  { rank.new(:king)  }
    let!(:queen) { rank.new(:queen) }
    let!(:jack)  { rank.new(:jack)  }

    let(:cards)  do
      cards = []
      suit.all.each do |suit|
        rank.all.each do |rank|
          cards << Cardshark::Card.new(rank, suit)
        end
      end
      cards
    end

    describe '#draw' do
      context 'new deck' do
        let(:deck) { described_class.new { cards } }

        before do
          @one = deck.draw
          @two = deck.draw
          @three = deck.draw
          @four = deck.draw
          @five = deck.draw
          @six = deck.draw
        end

        it 'returns a Cardshark::Card' do
          expect(@one).to be_a(Cardshark::Card)
        end

        it 'returns the first card first' do
          expect(@one).to eq(cards[0])
        end

        it 'returns the second card second' do
          expect(@two).to eq(cards[1])
        end

        it 'returns the third card third' do
          expect(@three).to eq(cards[2])
        end

        it 'returns the fourth card fourth' do
          expect(@four).to eq(cards[3])
        end

        it 'returns the fifth card fifth' do
          expect(@five).to eq(cards[4])
        end

        it 'returns the sixth card sixth' do
          expect(@six).to eq(cards[5])
        end

        context 'all cards drawn' do
          it 'raises an error' do
            expect { deck.draw }.to raise_error(Cardshark::Error::DeckExhausted)
          end
        end
      end

      context 'shuffled  deck' do
        let(:deck) { described_class.new { cards } }

        before do
          deck.shuffle!([3, 4, 1, 5, 2, 0])

          @one = deck.draw
          @two = deck.draw
          @three = deck.draw
          @four = deck.draw
          @five = deck.draw
          @six = deck.draw
        end

        it 'returns a Cardshark::Card' do
          expect(@one).to be_a(Cardshark::Card)
        end

        it 'returns the fourth card first' do
          expect(@one).to eq(cards[3])
        end

        it 'returns the fifth card second' do
          expect(@two).to eq(cards[4])
        end

        it 'returns the second card third' do
          expect(@three).to eq(cards[1])
        end

        it 'returns the sixth card fourth' do
          expect(@four).to eq(cards[5])
        end

        it 'returns the third card fifth' do
          expect(@five).to eq(cards[2])
        end

        it 'returns the first card sixth' do
          expect(@six).to eq(cards[0])
        end

        context 'all cards drawn' do
          it 'raises an error' do
            expect { deck.draw }.to raise_error(Cardshark::Error::DeckExhausted)
          end
        end
      end
    end

    describe '#count' do
      let(:deck) { described_class.new { cards } }

      it 'returns the correct number of cards' do
        expect(deck.count).to eq(6)
      end
    end

    describe '#shuffled?' do
      context 'new deck' do
        let(:deck) { described_class.new { cards } }

        it 'returns false' do
          expect(deck.shuffled?).to eq(false)
        end
      end

      context 'shuffled deck' do
        let(:deck) { described_class.new { cards } }

        before do
          deck.shuffle!([3, 1, 2, 0, 5, 4])
        end

        it 'returns true' do
          expect(deck.shuffled?).to eq(true)
        end
      end
    end

    describe 'shuffle!' do
      let(:deck) { described_class.new { cards } }

      context 'invalid arguments' do
        context 'no arguments' do
          it 'raises an ArgumentError' do
            expect { deck.shuffle! }.to raise_error(ArgumentError)
          end
        end

        context 'wrong argument type' do
          it 'raises an ArgumentError' do
            expect { deck.shuffle!('invalid-argument') }
              .to raise_error(ArgumentError)
          end
        end

        context 'invalid deck mapping' do
          context 'non-integer elements' do
            it 'raises an Cardshark::Error::DeckOrderInvalid' do
              expect { deck.shuffle!(['a', 1, 2, 3, 4, 5]) }
                .to raise_error(Cardshark::Error::DeckOrderInvalid)
            end
          end

          context 'elements out of bounds' do
            it 'raises an Cardshark::Error::DeckOrderInvalid' do
              expect { deck.shuffle!([0, 1, 2, 3, 4, 6]) }
                .to raise_error(Cardshark::Error::DeckOrderInvalid)
            end
          end

          context 'too many elements' do
            it 'raises an Cardshark::Error::DeckOrderInvalid' do
              expect { deck.shuffle!([0, 1, 2, 3, 4, 5, 6]) }
                .to raise_error(Cardshark::Error::DeckOrderInvalid)
            end
          end

          context 'too few elements' do
            it 'raises an Cardshark::Error::DeckOrderInvalid' do
              expect { deck.shuffle!([0, 1, 2, 3]) }
                .to raise_error(Cardshark::Error::DeckOrderInvalid)
            end
          end
        end
      end

      context 'valid arguments' do
        let(:deck_mapping) { [5, 4, 3, 2, 1, 0] }

        before do
          @result = deck.shuffle!(deck_mapping)
        end

        it 'returns an instance of the described class' do
          expect(@result).to be_a(described_class)
        end

        it 'returns the same instance' do
          expect(@result).to equal(deck)
        end

        context 'alredy shuffled' do
          it 'raises a Cardshark::Error::AlreadyShuffled' do
            expect { deck.shuffle!(deck_mapping) }
              .to raise_error(Cardshark::Error::DeckAlreadyShuffled)
          end
        end
      end
    end
  end
end
