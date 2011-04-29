require 'cardshark/deck'
require 'cardshark/card'

module Cardshark
  # Representation of the 40 Card italian deck. http://en.wikipedia.org/wiki/Playing_card#Italian

  class ItalianDeck
    attr_reader :SUITS
    include Deck
    RANKS = [:ace, :two, :three, :four, :five, :six, :seven, :jack, :queen, :king]
    SUITS = [:coins, :swords, :cups, :clubs]

    def initialize
      @cards = Array.new
      @cards += create_cards(SUITS, RANKS)
    end
  end
end
