require 'cardshark/uno_deck'

describe Cardshark::UnoDeck do
  #create a uno deck
  before :all do
    @uno = Cardshark::UnoDeck.new
  end

  it 'should contain 108 cards' do
    @uno.size.should == 108
  end
end