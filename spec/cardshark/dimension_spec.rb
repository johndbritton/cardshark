# frozen_string_literal: true

require 'cardshark/dimension'

RSpec.describe Cardshark::Dimension do
  describe '::new' do
    it 'raises an Error::AbstractClass' do
      expect { described_class.new(:id) }
        .to raise_exception(Cardshark::Error::AbstractClass)
    end
  end

  context 'when subclassed' do
    let(:subclass) { Class.new(described_class) }

    describe '::new' do
      context 'invalid arguments' do
        context 'no arguments' do
          it 'raises an ArgumentError' do
            expect { subclass.new }.to raise_exception(ArgumentError)
          end
        end

        context 'invalid arguments' do
          it 'raises an ArgumentError' do
            expect { subclass.new('invalid-argument') }
              .to raise_exception(ArgumentError)
          end
        end
      end

      context 'valid arguments' do
        before do
          @result = subclass.new(:id)
        end

        context 'return value' do
          it 'is a an instance of the class' do
            expect(@result).to be_an_instance_of(subclass)
          end

          it 'is a subclass of the described class' do
            expect(@result.class.superclass).to eq(described_class)
          end

          it 'returns the same object for the same id' do
            expect(@result).to equal(subclass.new(:id))
          end
        end
      end
    end

    describe '::all' do
      before { @result = subclass.all }

      it 'returns an Array' do
        expect(@result).to be_an(Array)
      end

      context 'it has not been instantiated' do
        it 'returns an empty Array' do
          expect(@result.count).to eq(0)
        end
      end

      context 'it has been instantiated' do
        before do
          @instances = []
          3.times { |i| @instances.push(subclass.new(i.to_s.to_sym)) }
          @result = subclass.all
        end
        after { clear_instance_metadata }

        it 'returns an array of instances' do
          expect(@result.first.class).to eq(subclass)
        end

        it 'returns all of the instances' do
          expect(@result).to match_array(@instances)
        end
      end
    end
  end

  # This cleans up metadata about subclasses so that
  # these specs can be run reliably in any order
  def clear_instance_metadata
    subclass.instance_variable_set(:@instances, {})
  end
end
