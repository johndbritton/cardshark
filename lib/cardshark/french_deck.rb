require 'cardshark/deck'
require 'cardshark/card'

module Cardshark
  class FrenchDeck
    include Deck
    RANKS = [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]
    SUITS = [:spades, :hearts, :diamonds, :clubs]
    JOKERS = [:joker]
    JOKER_SUITS = [:red, :black]

    def initialize(opts={:include_jokers => false})
      @cards = Array.new()
      @cards += create_cards(SUITS, RANKS)
      if opts[:include_jokers] then
        @cards += create_cards(JOKER_SUITS, JOKERS)
      end
    end
  end
end