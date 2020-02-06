# frozen_string_literal: true

require 'cardshark/error'

module Cardshark
  module Abstract
    def self.included(base)
      base.instance_variable_set(:@abstract, true)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def new
        @new ||= super
      end

      def abstract?
        if @abstract
          true
        else
          false
        end
      end

      private

      def inherited(subclass)
        subclass.instance_variable_set(:@abstract, false)
      end
    end

    def initialize
      raise Error::AbstractClass if self.class.abstract?
    end
  end
end
