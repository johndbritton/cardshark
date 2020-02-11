# Cardshark

## Example usage:

```ruby
require 'cardshark'

class Deck < Cardshark::Deck; end
class Card < Cardshark::Card; end
class Rank < Cardshark::Dimension; end
class Suit < Cardshark::Dimension; end

ranks = [
  :ace,
  :two,
  :three,
  :four,
  :five,
  :six,
  :seven,
  :eight,
  :nine,
  :ten,
  :jack,
  :queen,
  :king
].each do |name|
  Rank.new(name)
end

suits = [
  :clubs,
  :diamonds,
  :hearts,
  :spades
].each do |name|
  Suit.new(name)
end

deck = Deck.new do
  cards = []
  Suit.all.each do |suit|
    Rank.all.each do |rank|
      cards << Card.new(rank, suit)
    end
  end
  cards
end
```
