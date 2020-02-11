# frozen_string_literal: true

require 'cardshark/error'

module Cardshark
  class Deck
    def initialize(&block)
      raise ArgumentError if block.nil?

      @deck_order = nil
      @draw_position = 0
      @cards = yield || []

      @cards.each do |card|
        raise ArgumentError if card.class.is_a?(Card)
      end
    end

    def draw
      raise Error::DeckExhausted if draw_position >= cards.count

      card = cards[deck_order[draw_position]]
      @draw_position += 1
      card
    end

    def count
      cards.count
    end

    def shuffled?
      !@deck_order.nil?
    end

    def shuffle!(mapping)
      raise Error::DeckAlreadyShuffled if shuffled?

      validate_mapping(mapping)

      @deck_order = mapping

      self
    end

    private

    attr_reader :cards, :draw_position

    def deck_order
      return @deck_order unless @deck_order.nil?

      count.times.collect { |i| i }
    end

    def validate_mapping(mapping)
      ensure_mapping_is_array(mapping)
      ensure_mapping_is_correct_arity(mapping)
      ensure_mapping_is_correct_type(mapping)
      ensure_mapping_elements_in_bounds(mapping)
    end

    def ensure_mapping_is_array(mapping)
      raise ArgumentError if mapping.class != Array
    end

    def ensure_mapping_is_correct_arity(mapping)
      raise Error::DeckOrderInvalid if mapping.count != count
    end

    def ensure_mapping_is_correct_type(mapping)
      raise Error::DeckOrderInvalid if mapping.detect { |i| i.class != Integer }
    end

    def ensure_mapping_elements_in_bounds(mapping)
      raise Error::DeckOrderInvalid if mapping.detect do |i|
        i.negative? || i >= count
      end
    end
  end
end
