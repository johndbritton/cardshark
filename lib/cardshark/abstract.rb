# frozen_string_literal: true

require 'cardshark/error'

module Cardshark
  module Abstract
    def self.included(base)
      base.instance_variable_set(:@abstract, true)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def new(*)
        if instance_variable_defined?(:@abstract)
          if instance_variable_get(:@abstract) == true
            raise Error::AbstractClass
          end
        end

        super
      end

      private

      def inherited(subclass)
        subclass.instance_variable_set(:@abstract, false)
      end
    end
  end
end
