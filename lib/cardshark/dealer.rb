module Cardshark
  class Dealer
    attr_reader :data

    class << self
      def create(&blk)
        dealer = Dealer.new
        dealer.instance_eval(&blk)
        return dealer
      end
    end

    def initialize
      @data = {} #look at dat hash...he must work out.
    end

    def game(game)
      @data[:game] = game
    end

    def deal_direction(direction)
      @data[:deal_direction] = direction
    end

  end
end
