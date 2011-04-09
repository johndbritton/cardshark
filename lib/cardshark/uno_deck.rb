require 'cardshark/deck'
require 'cardshark/card'

module Cardshark
  class UnoDeck
    include Deck
    RANKS = [:one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :skip, :draw_two, :reverse]
    ZERO = [:zero]
    SUITS = [:red, :green, :blue, :yellow]
    SPECIALS = [ :wild, :wild_draw_four]
    SPECIAL_SUITS = [:black]
    
    def initialize()
      @cards = Array.new()
      2.times { @cards += create_cards(SUITS, RANKS) }
      @cards += create_cards(SUITS, ZERO)
      4.times { @cards += create_cards(SPECIAL_SUITS, SPECIALS)}
    end
  end
end