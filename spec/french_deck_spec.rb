require 'cardshark/french_deck'

describe Cardshark::FrenchDeck do
  #create a french (standard) deck
  before :all do
    @french = Cardshark::FrenchDeck.new
  end

  it 'should contain 52 cards' do
    @french.size.should == 52
  end
end