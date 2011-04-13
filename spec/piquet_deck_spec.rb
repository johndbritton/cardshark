require 'cardshark/piquet_deck'

describe Cardshark::PiquetDeck do
  #create a piquet deck
  before :all do
    @piquet = Cardshark::PiquetDeck.new
  end

  it 'should contain 32 cards' do
    @piquet.size.should == 32
  end
  
end