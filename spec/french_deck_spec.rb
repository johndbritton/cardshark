require 'cardshark/french_deck'

describe Cardshark::FrenchDeck do
  #create a french (standard) deck
  before :all do
    @french = Cardshark::FrenchDeck.new
    @french_with_jokers = Cardshark::FrenchDeck.new(:include_jokers => true)
  end

  it 'should contain 52 cards' do
    @french.size.should == 52
  end
  
  it 'should contain 54 cards' do
    @french_with_jokers.size == 54
  end
end