# frozen_string_literal: true

require 'cardshark/deck/base'

RSpec.describe Cardshark::Deck::Base do
  let(:suit)     { Class.new { include Cardshark::Dimension } }

  let(:clubs)    { Class.new(suit).new }
  let(:diamonds) { Class.new(suit).new }
  let(:hearts)   { Class.new(suit).new }
  let(:spades)   { Class.new(suit).new }

  let(:rank)     { Class.new { include Cardshark::Dimension } }

  let(:ace)      { Class.new(rank).new }
  let(:two)      { Class.new(rank).new }
  let(:three)    { Class.new(rank).new }
  let(:four)     { Class.new(rank).new }
  let(:five)     { Class.new(rank).new }
  let(:six)      { Class.new(rank).new }
  let(:seven)    { Class.new(rank).new }
  let(:eight)    { Class.new(rank).new }
  let(:nine)     { Class.new(rank).new }
  let(:ten)      { Class.new(rank).new }
  let(:jack)     { Class.new(rank).new }
  let(:queen)    { Class.new(rank).new }
  let(:king)     { Class.new(rank).new }

  let(:ace_of_clubs)      { Cardshark::Card::Base.new([ace, clubs]) }
  let(:two_of_clubs)      { Cardshark::Card::Base.new([ace, clubs]) }
  let(:three_of_clubs)    { Cardshark::Card::Base.new([ace, clubs]) }
  let(:four_of_clubs)     { Cardshark::Card::Base.new([ace, clubs]) }
  let(:five_of_clubs)     { Cardshark::Card::Base.new([ace, clubs]) }
  let(:six_of_clubs)      { Cardshark::Card::Base.new([ace, clubs]) }
  let(:seven_of_clubs)    { Cardshark::Card::Base.new([ace, clubs]) }
  let(:eight_of_clubs)    { Cardshark::Card::Base.new([ace, clubs]) }
  let(:nine_of_clubs)     { Cardshark::Card::Base.new([ace, clubs]) }
  let(:ten_of_clubs)      { Cardshark::Card::Base.new([ace, clubs]) }
  let(:jack_of_clubs)     { Cardshark::Card::Base.new([ace, clubs]) }
  let(:queen_of_clubs)    { Cardshark::Card::Base.new([ace, clubs]) }
  let(:king_of_clubs)     { Cardshark::Card::Base.new([ace, clubs]) }

  let(:ace_of_diamonds)   { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:two_of_diamonds)   { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:three_of_diamonds) { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:four_of_diamonds)  { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:five_of_diamonds)  { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:six_of_diamonds)   { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:seven_of_diamonds) { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:eight_of_diamonds) { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:nine_of_diamonds)  { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:ten_of_diamonds)   { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:jack_of_diamonds)  { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:queen_of_diamonds) { Cardshark::Card::Base.new([ace, diamonds]) }
  let(:king_of_diamonds)  { Cardshark::Card::Base.new([ace, diamonds]) }

  let(:ace_of_hearts)     { Cardshark::Card::Base.new([ace, hearts]) }
  let(:two_of_hearts)     { Cardshark::Card::Base.new([ace, hearts]) }
  let(:three_of_hearts)   { Cardshark::Card::Base.new([ace, hearts]) }
  let(:four_of_hearts)    { Cardshark::Card::Base.new([ace, hearts]) }
  let(:five_of_hearts)    { Cardshark::Card::Base.new([ace, hearts]) }
  let(:six_of_hearts)     { Cardshark::Card::Base.new([ace, hearts]) }
  let(:seven_of_hearts)   { Cardshark::Card::Base.new([ace, hearts]) }
  let(:eight_of_hearts)   { Cardshark::Card::Base.new([ace, hearts]) }
  let(:nine_of_hearts)    { Cardshark::Card::Base.new([ace, hearts]) }
  let(:ten_of_hearts)     { Cardshark::Card::Base.new([ace, hearts]) }
  let(:jack_of_hearts)    { Cardshark::Card::Base.new([ace, hearts]) }
  let(:queen_of_hearts)   { Cardshark::Card::Base.new([ace, hearts]) }
  let(:king_of_hearts)    { Cardshark::Card::Base.new([ace, hearts]) }

  let(:ace_of_spades)     { Cardshark::Card::Base.new([ace, spades]) }
  let(:two_of_spades)     { Cardshark::Card::Base.new([ace, spades]) }
  let(:three_of_spades)   { Cardshark::Card::Base.new([ace, spades]) }
  let(:four_of_spades)    { Cardshark::Card::Base.new([ace, spades]) }
  let(:five_of_spades)    { Cardshark::Card::Base.new([ace, spades]) }
  let(:six_of_spades)     { Cardshark::Card::Base.new([ace, spades]) }
  let(:seven_of_spades)   { Cardshark::Card::Base.new([ace, spades]) }
  let(:eight_of_spades)   { Cardshark::Card::Base.new([ace, spades]) }
  let(:nine_of_spades)    { Cardshark::Card::Base.new([ace, spades]) }
  let(:ten_of_spades)     { Cardshark::Card::Base.new([ace, spades]) }
  let(:jack_of_spades)    { Cardshark::Card::Base.new([ace, spades]) }
  let(:queen_of_spades)   { Cardshark::Card::Base.new([ace, spades]) }
  let(:king_of_spades)    { Cardshark::Card::Base.new([ace, spades]) }

  describe '::new' do
    context 'invalid arguments' do
      context 'missing arguments' do
        it 'raises an ArgumentError' do
          expect { described_class.new }.to raise_exception(ArgumentError)
        end
      end

      context 'incorrect type' do
        it 'raises an ArgumentError' do
          expect { described_class.new('invalid arguments') }
            .to raise_exception(ArgumentError)
        end
      end

      context 'empty array' do
        it 'raises an ArgumentError' do
          expect { described_class.new([]) }.to raise_exception(ArgumentError)
        end
      end

      context 'array with incorrect values' do
        it 'raises an ArgumentError' do
          expect { described_class.new(%w[incorrect values]) }
            .to raise_exception(ArgumentError)
        end
      end
    end

    context 'valid arguments' do
      context 'one card' do
        let(:cards) { [ace_of_spades] }

        it 'returns a Deck' do
          expect(described_class.new(cards)).to be_a(described_class)
        end
      end

      context 'multiple cards' do
        let(:cards) do
          [ace_of_clubs, ace_of_diamonds, ace_of_hearts, ace_of_spades]
        end

        before do
          @result = described_class.new(cards)
        end

        it 'returns a Deck' do
          expect(@result).to be_a(described_class)
        end
      end
    end
  end
end
