# frozen_string_literal: true

require 'cardshark/abstract'

RSpec.describe Cardshark::Abstract do
  context 'included into a new class' do
    let(:klass) { Class.new { include Cardshark::Abstract } }

    describe '::new' do
      it 'raises a Cardshark::Error::AbstractClass' do
        expect { klass.new }.to raise_error(Cardshark::Error::AbstractClass)
      end

      context 'it has been subclassed' do
        let(:subclass) { Class.new(klass) }

        it 'does not raise an error' do
          expect { subclass.new }.not_to raise_error
        end

        it 'returns an instance of the subclass' do
          expect(subclass.new).to be_a(subclass)
        end
      end
    end
  end
end
