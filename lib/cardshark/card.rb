# frozen_string_literal: true

require 'cardshark/dimension'

module Cardshark
  class Card
    def initialize(*args)
      validate_arguments(args)

      @dimensions = {}
      args.each { |arg| @dimensions[arg.class.id] = arg }
      define_dimension_methods
    end

    def dimensions
      @dimensions.keys
    end

    private

    def define_dimension_methods
      @dimensions.keys.each do |dimension|
        define_singleton_method dimension do
          @dimensions[dimension]
        end
      end
    end

    def validate_arguments(args)
      raise ArgumentError if args.empty?
      raise ArgumentError if args.detect { |arg| !arg.is_a?(Dimension) }
      raise ArgumentError unless args.uniq(&:class).count == args.count
    end
  end
end
