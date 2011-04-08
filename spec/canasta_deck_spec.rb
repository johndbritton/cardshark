require 'cardshark/canasta_deck'

describe Cardshark::CanastaDeck do
  #create a french (standard) deck
  before :all do
    @canasta = Cardshark::CanastaDeck.new
  end

  it 'should contain 108 cards' do
    @canasta.size.should == 108
  end
  
end