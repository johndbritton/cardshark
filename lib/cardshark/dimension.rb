# frozen_string_literal: true

require 'cardshark/abstract'
require 'cardshark/error'

module Cardshark
  module Dimension
    def self.included(base)
      base.class_eval { include Cardshark::Abstract }
      base.instance_variable_set(:@subclasses, [])
      base.instance_variable_set(:@dimension_base, true)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def all
        @subclasses
      end

      private

      def inherited(subclass)
        parent = subclass.superclass

        unless parent.instance_variable_defined?(:@dimension_base) &&
               parent.instance_variable_get(:@dimension_base) == true
          raise Error::DimensionInheritanceLimit
        end

        @subclasses.push(subclass)
      end
    end
  end
end
