# frozen_string_literal: true

require 'cardshark/abstract'
require 'cardshark/error'

module Cardshark
  class Dimension
    include Abstract

    def self.new(id)
      raise ArgumentError if id.class != Symbol

      if instances[id].nil?
        instances[id] = super
      else
        instances[id]
      end
    end

    def self.all
      instances.values
    end

    def self.id
      if name.nil?
        object_id.to_s.downcase.to_sym
      else
        name.split('::').last.gsub(/(.)([A-Z])/, '\1_\2').downcase.to_sym
      end
    end

    def initialize(id)
      @id = id
    end

    def to_s
      id.to_s.capitalize
    end

    private

    class << self
      private

      def instances
        @instances ||= {}
      end
      attr_writer :instances
    end

    attr_accessor :id

    def inherited(_subclass)
      raise Error::DimensionInheritanceLimit
    end
  end
end
