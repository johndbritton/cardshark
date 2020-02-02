# frozen_string_literal: true

require 'cardshark/error'

module Cardshark
  class Rank
    @ranks = []

    class << self
      def new
        @new ||= super
      end

      def inherited(subclass)
        @ranks.push(subclass)
      end

      def all
        @ranks
      end
    end

    def initialize
      raise Error::AbstractClass if self.class == Rank
    end
  end
end
