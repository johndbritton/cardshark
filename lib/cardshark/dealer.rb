module Cardshark
  class Dealer
    attr_reader :data

    # Cardshark::Dealer.create do
    #   game "hold-em"
    #   deal_direction "clockwise"
    # end
    #
    # Perhaps at some point this method should be
    # renamed 'add' if you were thinking of supporting
    # multiple dealers in a game.
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

    # Accepts a game type
    #
    # game - the type of game you wish the dealer to support
    #
    # Currently no functionality beyond defining gametype.
    # Meaning we have no predefined rules for "hold-em" etc.
    def game(game)
      @data[:game] = game
    end

    # Sets the direction of the cards to be dealt
    #
    # direction - the directin you wish the cards to be dealt
    #             clockwise or counter-clockwise
    #
    # Currently no functionality beyond defining direction.
    def deal_direction(direction)
      @data[:deal_direction] = direction
    end

  end
end
