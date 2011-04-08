require 'cardshark/deck'
require 'cardshark/card'

module Cardshark
  class FrenchDeck
    include Deck
    RANKS = [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]
    SUITS = [:spades, :hearts, :diamonds, :clubs]
    SPECIALS = [{:rank => :joker, :suit => :red}, {:rank => :joker, :suit => :black}]

    def initialize(opts={:include_jokers => false})
      @cards = Array.new()
      SUITS.each do |suit|
        RANKS.each do |rank|
          @cards.push Card.new(:rank => rank, :suit => suit)
        end
      end
      if opts[:include_jokers] then
        SPECIALS.each do |special|
          @cards.push Card.new(:rank => special[:rank], :suit => special[:suit])
        end
      end
    end
  end
end