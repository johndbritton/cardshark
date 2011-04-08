require 'cardshark/card'

describe Cardshark::Card do
  before :all do
    @card = Cardshark::Card.new(:rank => :K, :suit => :H)
  end
  
  it 'has a rank' do
    @card.rank.should == :K
  end
  
  it 'has a suit' do
    @card.suit.should == :H
  end
end