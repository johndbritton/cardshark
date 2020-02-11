# frozen_string_literal: true

module Cardshark
  class Error < StandardError
    class AbstractClass < Error; end
    class DeckAlreadyShuffled < Error; end
    class DeckExhausted < Error; end
    class DeckOrderInvalid < Error; end
    class DimensionInheritanceLimit < Error; end
  end
end
