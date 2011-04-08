require 'cardshark/deck'

describe Cardshark::Deck do
  #create a french (standard) deck
  before :all do
    @deck = Cardshark::Deck.new(Cardshark::Decks::FRENCH)
  end
  
  it 'should contain 52 cards' do
    @deck.size.should == 52
  end
end