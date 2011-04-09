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
    
    # Helper method that builds cards
    def create_cards(suits, ranks)
      created_cards = Array.new
      suits.each do |suit|
        ranks.each do |rank|
          created_cards.push Card.new(:rank => rank, :suit => suit)
        end
      end
      created_cards
    end
    
  end
end