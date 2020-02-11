# frozen_string_literal: true

require 'cardshark/error'

RSpec.describe Cardshark::Error::AbstractClass do
  describe '::new' do
    before do
      @result = described_class.new
    end

    context 'return value' do
      it 'is a an instance of the class' do
        expect(@result).to be_an_instance_of(described_class)
      end

      it 'is a kind of Cardshark::Error' do
        expect(@result).to be_kind_of(Cardshark::Error)
      end
    end
  end
end
