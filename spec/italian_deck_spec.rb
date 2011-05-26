require 'cardshark/italian_deck'

describe Cardshark::ItalianDeck do
  #create an italian deck
  before :all do
    @italian = Cardshark::ItalianDeck.new
  end

  it 'should contain 40 cards' do
    @italian.size.should == 40
  end

  it 'should have 4 suits' do
    suits = @italian.cards.group_by {|card| card.suit}.length
    suits.should == 4
  end
end
