# frozen_string_literal: true

require 'cardshark/rank'

RSpec.describe Cardshark::Rank do
  describe '::new' do
    it 'raises a Cardshark::Error::AbstractClass' do
      expect { described_class.new }
        .to raise_error(Cardshark::Error::AbstractClass)
    end
  end

  describe '::all' do
    before { @result = described_class.all }

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
        3.times { @subclasses.push(Class.new(described_class)) }
        @result = described_class.all
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

  context 'when subclassed' do
    before { @subclass = Class.new(described_class) }
    after { clear_subclass_metadata }

    describe '::new' do
      context 'return value' do
        it 'is a an instance of the subclass' do
          expect(@subclass.new).to be_an_instance_of(@subclass)
        end

        it 'is a kind of Cardshark::Rank' do
          expect(@subclass.new).to be_kind_of(Cardshark::Rank)
        end
      end

      it 'behaves as a singleton' do
        expect(@subclass.new).to equal(@subclass.new)
      end
    end
  end

  # This cleans up metadata about subclasses so that
  # these specs can be run reliably in any order
  def clear_subclass_metadata
    described_class.instance_variable_set(:@ranks, [])
  end
end
