# frozen_string_literal: true

require 'cardshark/card/base'

RSpec.describe Cardshark::Card::Base do
  let(:suit)     { Class.new { include Cardshark::Dimension } }

  let(:clubs)    { Class.new(suit).new }
  let(:diamonds) { Class.new(suit).new }
  let(:hearts)   { Class.new(suit).new }
  let(:spades)   { Class.new(suit).new }

  let(:rank)     { Class.new { include Cardshark::Dimension } }

  let(:ace)      { Class.new(rank).new }
  let(:two)      { Class.new(rank).new }
  let(:three)    { Class.new(rank).new }
  let(:four)     { Class.new(rank).new }
  let(:five)     { Class.new(rank).new }
  let(:six)      { Class.new(rank).new }
  let(:seven)    { Class.new(rank).new }
  let(:eight)    { Class.new(rank).new }
  let(:nine)     { Class.new(rank).new }
  let(:ten)      { Class.new(rank).new }
  let(:jack)     { Class.new(rank).new }
  let(:queen)    { Class.new(rank).new }
  let(:king)     { Class.new(rank).new }

  describe '::new' do
    context 'valid arguments' do
      it 'raises a Cardshark::Error::AbstractClass' do
        expect { described_class.new([ace, spades]) }
          .to raise_error(Cardshark::Error::AbstractClass)
      end
    end

    context 'when subclassed' do
      let(:subclass) { Class.new(described_class) }

      context 'invalid arguments' do
        context 'missing arguments' do
          it 'raises an ArgumentError' do
            expect { subclass.new }.to raise_exception(ArgumentError)
          end
        end

        context 'incorrect type' do
          it 'raises an ArgumentError' do
            expect { subclass.new('invalid arguments') }
              .to raise_exception(ArgumentError)
          end
        end

        context 'empty array' do
          it 'raises an ArgumentError' do
            expect { subclass.new([]) }.to raise_exception(ArgumentError)
          end
        end

        context 'array with incorrect values' do
          it 'raises an ArgumentError' do
            expect { subclass.new(%w[incorrect values]) }
              .to raise_exception(ArgumentError)
          end
        end

        context 'classes instead of instances' do
          it 'raises an ArgumentError' do
            expect { subclass.new([Class.new(rank)]) }
              .to raise_exception(ArgumentError)
          end
        end

        context 'multiple distinct values from the same dimension' do
          it 'raises an ArgumentError' do
            expect { subclass.new([ace, king]) }
              .to raise_exception(ArgumentError)
          end
        end
      end

      context 'valid arguments' do
        context 'only one value from one dimension' do
          it 'returns a Card' do
            expect(subclass.new([ace])).to be_a(subclass)
          end
        end

        context 'multiple distinct values from different dimensions' do
          it 'returns a Card' do
            expect(subclass.new([ace, spades]))
              .to be_a(subclass)
          end
        end
      end
    end
  end
end
