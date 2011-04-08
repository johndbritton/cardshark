require 'cardshark/uno_deck'

describe Cardshark::UnoDeck do
  #create a uno deck
  before :all do
    @uno = Cardshark::UnoDeck.new
  end

  it 'should contain 108 cards' do
    @uno.size.should == 108
  end
  
  it 'should contain one zero in each suit' do
    zeros = Hash.new
    Cardshark::UnoDeck::SUITS.each do |suit|
      zeros[suit] = 0
    end
    @uno.cards.each do |card|
      if card.rank == :zero then
        zeros[card.suit] += 1 
      end
    end
    Cardshark::UnoDeck::SUITS.each do |suit|
      zeros[suit].should == 1
    end
  end

  it 'should contain two of each rank other than zero in each suit' do
    cards = Hash.new
    Cardshark::UnoDeck::RANKS.each do |rank|
      cards[rank] = Hash.new
      Cardshark::UnoDeck::SUITS.each do |suit|
        cards[rank][suit] = 0
      end
    end
    @uno.cards.each do |card|
      if Cardshark::UnoDeck::RANKS.include?(card.rank)      
        cards[card.rank][card.suit] += 1
      end
    end
    Cardshark::UnoDeck::RANKS.each do |rank|
      Cardshark::UnoDeck::SUITS.each do |suit|
        cards[rank][suit].should == 2 unless rank == :zero
      end
    end
  end
end