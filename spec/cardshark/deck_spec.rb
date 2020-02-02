require 'cardshark/deck'

describe Cardshark::Deck do
  #define a simple deck for testing basic functionality of the module
  module Cardshark
    class SimpleDeck
      include Deck
      def initialize
        @cards = Array.new
        for i in 1..10 do
          @cards.push Card.new(:rank => i, :suit => :anything)
        end
      end
    end
  end
  
  before :each do
    @simple = Cardshark::SimpleDeck.new
  end

  it 'should contain 10 cards' do
    @simple.size.should == 10
  end
  
  it 'should not be shuffled' do
    @simple.shuffled?.should == false 
  end
  
  it 'should be in order' do
    for i in 0..9 do
      @simple.cards[i].rank.should == i+1
    end
  end
  
  it 'should be shuffled' do
    @simple.shuffle!
    @simple.shuffled?.should == true
  end
end