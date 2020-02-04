# frozen_string_literal: true

require 'cardshark/error'

module Cardshark
  module Dimension
    def self.included(base)
      base.instance_variable_set(:@abstract, true)
      base.instance_variable_set(:@subclasses, [])
      base.extend(ClassMethods)
    end

    module ClassMethods
      def new
        @new ||= super
      end

      def all
        @subclasses
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
        unless subclass.superclass.abstract?
          raise Error::DimensionInheritanceLimit
        end

        subclass.instance_variable_set(:@abstract, false)
        @subclasses.push(subclass)
      end
    end

    def initialize
      raise Error::AbstractClass if self.class.abstract?
    end
  end
end
