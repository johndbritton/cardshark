module Cardshark
  class Card
    attr_reader :rank, :suit
    def initialize(card)
      @rank = card[:rank]
      @suit = card[:suit]
      self.freeze
    end
  end
end