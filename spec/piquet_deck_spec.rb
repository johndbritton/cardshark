require 'cardshark/piquet_deck'

describe Cardshark::PiquetDeck do
  #create a piquet deck
  before :all do
    @piquet = Cardshark::PiquetDeck.new
  end

  it 'should contain 32 cards' do
    @piquet.size.should == 32
  end

  it 'should contain 4 suits' do
    #could be @piquiet.cards.group_by(&:suits) but that's slower in 1.8.7
    suits = @piquet.cards.group_by {|card| card.suit}.length
    #could be suits.should be 4
    suits.should == 4
  end
end
