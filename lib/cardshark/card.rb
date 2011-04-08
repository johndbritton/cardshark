module Cardshark
  class Card
    attr_reader :rank, :suit
    def initialize(rank, suit)
      @rank = rank
      @suit = suit
      self.freeze
    end
  end
end