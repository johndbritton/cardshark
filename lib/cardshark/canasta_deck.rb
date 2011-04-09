require 'cardshark/deck'
require 'cardshark/card'

module Cardshark
  # Representation of the 108 Card deck used to play Canasta. Essentially it is two French Decks with the Jokers included.
  class CanastaDeck
    include Deck
    RANKS = [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]
    SUITS = [:spades, :hearts, :diamonds, :clubs]
    JOKERS = [:joker]
    JOKER_SUITS = [:red, :black]
    
    def initialize
      @cards = Array.new()
      2.times do 
        @cards += create_cards(SUITS, RANKS)
        @cards += create_cards(JOKER_SUITS, JOKERS)
      end
    end
  end
end