require 'cardshark/deck'
require 'cardshark/card'

module Cardshark
  class UnoDeck
    include Deck
    RANKS = [:zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :skip, :draw_two, :reverse]
    SUITS = [:red, :green, :blue, :yellow]
    SPECIALS = [{:rank => :wild, :suit => :black}, {:rank => :wild_draw_four, :suit => :black}]

    def initialize(opts={:include_jokers => false})
      @cards = Array.new()
      SUITS.each do |suit|
        RANKS.each do |rank|
          @cards.push Card.new(:rank => rank, :suit => suit)
          @cards.push Card.new(:rank => rank, :suit => suit) unless rank == :zero
        end
      end
      SPECIALS.each do |special|
        4.times do
          @cards.push Card.new(:rank => special[:rank], :suit => special[:suit])
        end
      end
    end
  end
end