# frozen_string_literal: true

require 'cardshark/dimension'

module Cardshark
  module Card
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

      def initialize(dimensions)
        raise Error::AbstractClass if self.class.abstract?

        @dimensions = dimensions
        raise ArgumentError unless valid_dimensions?
      end

      private

      def valid_dimensions?
        return false unless @dimensions.class == Array
        return false unless @dimensions.count >= 1
        return false unless only_dimensions?
        return false unless unique_dimensions?

        true
      end

      def no_classes?
        if @dimensions.detect { |item| item.class == Class }
          false
        else
          true
        end
      end

      def only_dimensions?
        if @dimensions.detect { |item| !dimension?(item) }
          false
        else
          true
        end
      end

      def dimension?(subject)
        if subject.class.ancestors.include?(Dimension)
          true
        else
          false
        end
      rescue StandardError
        false
      end

      def unique_dimensions?
        unique_dimensions = @dimensions.uniq do |item|
          item.class.superclass
        end
        # unique_dimensions = @dimensions.uniq(&:superclass)
        @dimensions.count == unique_dimensions.count
      rescue StandardError
        false
      end
    end
  end
end
