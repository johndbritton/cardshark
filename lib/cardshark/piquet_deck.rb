require 'cardshark/deck'
require 'cardshark/card'

module Cardshark
  # Representation of the 32 Card deck used to play Piquet. http://en.wikipedia.org/wiki/Playing_card#Piquet
  class PiquetDeck
    include Deck
    RANKS = [:ace, :seven, :eight, :nine, :ten, :jack, :queen, :king]
    SUITS = [:spades, :hearts, :diamonds, :clubs]
    
    def initialize
      @cards = Array.new()
      @cards += create_cards(SUITS, RANKS)
    end
  end
end