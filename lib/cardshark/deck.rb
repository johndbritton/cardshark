require 'cardshark/decks'

module Cardshark
  class Deck
    def initialize(deck)
      @cards = Array.new()
      deck[:suits].each do |suit|
        deck[:ranks].each do |rank|
          @cards.push Card.new(:rank => rank, :suit => suit)
        end
      end
    end
    
    def size
      @cards.size
    end
  end
end