require 'cardshark/deck'
require 'cardshark/card'

module Cardshark
  # Representation of the 40 Card italian deck. http://en.wikipedia.org/wiki/Playing_card#Italian

  class ItalianDeck
    include Deck
    # The wiki article states the face cards are Re(king), Cavallo(queen),
    # and Fante(jack) but i've kept them the same as a French deck here
    # for consistency sake
    RANKS = [:ace, :two, :three, :four, :five, :six, :seven, :jack, :queen, :king]
    SUITS = [:coins, :swords, :cups, :clubs]

    def initialize
      @cards = Array.new
      @cards += create_cards(SUITS, RANKS)
    end
  end
end
