require_relative 'item'

class MusicAlbum < Item
  attr_accessor :artist, :genre, :on_spotify

  def initialize(title, published_date, artist, genre, on_spotify)
    super(title, published_date)
    @title = title
    @published_date = published_date
    @artist = artist
    @genre = genre
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def as_json(*)
    {
      type: 'music_album',
      title: @title,
      published_date: @published_date,
      artist: @artist,
      genre: @genre,
      on_spotify: @on_spotify
    }
  end
end
