module Cardshark
  module Deck
    def size
      @cards.size
    end
    
    def cards
      @cards
    end
    
    def shuffle!
      @cards.shuffle!
      @shuffled = true
    end
    
    def shuffled?
      return false unless @shuffled
      true
    end
  end
end