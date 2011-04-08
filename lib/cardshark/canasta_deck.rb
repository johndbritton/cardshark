require 'cardshark/deck'
require 'cardshark/card'
require 'cardshark/french_deck'

module Cardshark
  class CanastaDeck
    include Deck
    RANKS = [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]
    SUITS = [:spades, :hearts, :diamonds, :clubs]
    SPECIALS = [{:rank => :joker, :suit => :red}, {:rank => :joker, :suit => :black}]
    
    def initialize
      @cards = Array.new()
      2.times do 
        SUITS.each do |suit|
          RANKS.each do |rank|
            @cards.push Card.new(:rank => rank, :suit => suit)
          end
        end
        SPECIALS.each do |special|
          @cards.push Card.new(:rank => special[:rank], :suit => special[:suit])
        end
      end
    end
  end
end