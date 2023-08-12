require_relative '../music/genre'
require_relative '../item'
require 'rspec'

RSpec.describe Genre do
  let(:genre_name) { 'Rock' }
  let(:genre) { Genre.new(genre_name) }

  describe '#initialize' do
    it 'sets the name' do
      expect(genre.name).to eq(genre_name)
    end

    it 'initializes an empty items array' do
      expect(genre.items).to be_empty
    end
  end

  describe '#as_json' do
    it 'returns a hash with genre attributes' do
      expected_json = {
        name: genre_name,
        items: []
      }

      expect(genre.as_json).to eq(expected_json)
    end
  end
end
