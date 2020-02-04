# frozen_string_literal: true

module Cardshark
  class Error < StandardError
    class AbstractClass < Error; end
    class DimensionInheritanceLimit < Error; end
  end
end
