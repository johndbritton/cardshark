# frozen_string_literal: true

require 'cardshark/dimension'

RSpec.describe Cardshark::Dimension do
  context 'included into a new class' do
    let(:klass) do
      Class.new { include Cardshark::Dimension }
    end

    describe '::new' do
      it 'raises a Cardshark::Error::AbstractClass' do
        expect { klass.new }
          .to raise_error(Cardshark::Error::AbstractClass)
      end
    end

    describe '::all' do
      before { @result = klass.all }

      it 'returns an Array' do
        expect(@result).to be_an(Array)
      end

      context 'it has not been subclassed' do
        it 'returns an empty Array' do
          expect(@result.count).to eq(0)
        end
      end

      context 'it has been subclassed' do
        before do
          @subclasses = []
          3.times { @subclasses.push(Class.new(klass)) }
          @result = klass.all
        end
        after { clear_subclass_metadata }

        it 'returns an array of Classes' do
          expect(@result.first.class).to eq(Class)
        end

        it 'returns all of the subclasses' do
          expect(@result).to match_array(@subclasses)
        end
      end
    end

    describe '::abstract' do
      it 'returns true' do
        expect(klass.abstract?).to eq(true)
      end
    end

    context 'when subclassed' do
      before { @subclass = Class.new(klass) }
      after { clear_subclass_metadata }

      describe 'subclassing a the subclass' do
        it 'raises an error' do
          expect { Class.new(@subclass) }
            .to raise_exception(Cardshark::Error::DimensionInheritanceLimit)
        end
      end

      describe '::new' do
        context 'return value' do
          it 'is a an instance of the subclass' do
            expect(@subclass.new).to be_an_instance_of(@subclass)
          end

          it 'is a kind of Cardshark::Dimension' do
            expect(@subclass.new).to be_kind_of(Cardshark::Dimension)
          end
        end

        it 'behaves as a singleton' do
          expect(@subclass.new).to equal(@subclass.new)
        end
      end

      describe '::abstract' do
        it 'returns false' do
          expect(@subclass.abstract?).to eq(false)
        end
      end
    end

    # This cleans up metadata about subclasses so that
    # these specs can be run reliably in any order
    def clear_subclass_metadata
      klass.instance_variable_set(:@subclasses, [])
    end
  end
end
