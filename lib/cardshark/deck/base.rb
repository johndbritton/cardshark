# frozen_string_literal: true

require 'cardshark/error'
require 'cardshark/card'

module Cardshark
  module Deck
    class Base
      @abstract = true

      def self.abstract?
        if @abstract
          true
        else
          false
        end
      end

      def self.inherited(subclass)
        subclass.instance_variable_set(:@abstract, false)
      end

      def initialize(cards)
        raise Error::AbstractClass if self.class.abstract?

        @cards = cards
        raise ArgumentError unless valid_cards?
      end

      private

      def valid_cards?
        return false unless @cards.class == Array
        return false unless @cards.count >= 1
        return false unless only_cards?

        true
      end

      def only_cards?
        non_card = @cards.detect do |item|
          !item.class.ancestors.include?(Card::Base)
        end

        if non_card
          false
        else
          true
        end
      end
    end
  end
end
