require 'cardshark/canasta_deck'

describe Cardshark::CanastaDeck do
  #create a canasta deck
  before :all do
    @canasta = Cardshark::CanastaDeck.new
  end

  it 'should contain 108 cards' do
    @canasta.size.should == 108
  end

  it 'should contain 6 suits' do
    suits = @canasta.cards.group_by {|card| card.suit}.length
    suits.should == 6
  end
end
