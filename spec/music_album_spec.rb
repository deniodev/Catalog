require_relative '../music/music_album'
require_relative '../item'
require 'rspec'
require 'date'

RSpec.describe MusicAlbum do
  let(:published_date) { Date.new(2020, 1, 1).year }
  let(:music_album) { MusicAlbum.new('Album Title', published_date, 'Artist Name', 'Genre Name', true) }

  describe '#can_be_archived?' do
    context 'when published less than 10 years ago and on Spotify' do
      it 'returns false' do
        allow(music_album).to receive(:arc).and_return(9)
        expect(music_album.can_be_archived?).to be(false)
      end
    end

    context 'when not on Spotify' do
      it 'returns false' do
        music_album.on_spotify = false
        allow(music_album).to receive(:years_since_published).and_return(11)
        expect(music_album.can_be_archived?).to be(false)
      end
    end
  end

  describe '#as_json' do
    it 'returns a hash with music album attributes' do
      expected_json = {
        type: 'music_album',
        title: 'Album Title',
        published_date: published_date,
        artist: 'Artist Name',
        genre: 'Genre Name',
        on_spotify: true
      }

      expect(music_album.as_json).to eq(expected_json)
    end
  end
end
