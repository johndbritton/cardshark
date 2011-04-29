require 'cardshark/italian_deck'

describe Cardshark::ItalianDeck do
  #create an italian deck
  before :all do
    @italian = Cardshark::ItalianDeck.new
  end

  it 'should contain 40 cards' do
    @italian.size.should eql(40)
  end
end
