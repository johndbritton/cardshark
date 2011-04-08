require 'cardshark/deck'

describe Cardshark::Card do
  before :all do
    @deck = Cardshark::Deck.new()
  end
  
  it 'has a rank' do
    @card.rank.should == :K
  end
  
  it 'has a suit' do
    @card.suit.should == :H
  end
end