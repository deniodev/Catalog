require_relative 'genre'
require_relative 'music_album'
require 'json'

class App
  def initialize
    @items = []
    @genres = []
    @music_albums = []
  end

  def load_data
    @music_albums = JSON.parse(File.read('music_albums.json')) unless File.empty?('music_albums.json')
    @genres = JSON.parse(File.read('music_genres.json')) unless File.empty?('music_genres.json')
  end

  def save_music_albums
    File.write('music_albums.json', @music_albums.to_json)
  end

  def display_menu
    puts '1. Add genre'
    puts '2. Add music album'
    puts '3. list music album'
    puts '4. List music genres'
    puts '5. exit'
  end

  def save_music_genres
    File.open('music_genres.json', 'w') do |f|
      f.puts @genres.to_json
    end
  end

  def add_genre
    puts 'Enter genre name:'
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre.as_json
    save_music_genres
    puts "genre added sucessfully: genre = #{@genres}"
  end

  def select_genre
    puts 'select option to add genre:'
    puts '0. enter new genre'
    @genres.each_with_index { |genre, index| puts "#{index + 1}. #{genre["name"]}"}
    input = gets.chomp.to_i
    if input == 0
      add_genre
      select_genre
    else
      input = @genres[input - 1]['name'] || @genres[input - 1][:name] || 'invalid input'
    end
    input
  end

  def add_music_album
    puts 'Enter music album title:'
    title = gets.chomp
    puts 'Enter music album published date:'
    published_date = gets.chomp
    puts 'Enter music album artist:'
    artist = gets.chomp
    genre = select_genre
    puts 'is the album on spotify:'
    on_spotify = gets.chomp
    music_album = MusicAlbum.new(title, published_date, artist, genre, on_spotify)
    @music_albums << music_album.as_json
    @genres.each do |saved_genre|
      if saved_genre['name'] == genre
        puts "saved_genre = #{saved_genre}"
        saved_genre['items'] << music_album.as_json
        puts "saved_genre = #{saved_genre['items']}"
      end
    end
    save_music_albums
    save_music_genres
  end

  def list_music_albums
    @music_albums.each do |music_album|
      puts music_album
    end
  end

  def list_music_genres
    @genres.each do |genre|
      puts genre
    end
  end

  def main_loop
    load_data
    loop do
      display_menu
      puts 'Enter your choice:'
      input = gets.chomp.to_i

      case input
      when 1
        add_genre
      when 2
        add_music_album
      when 3
        list_music_albums
      when 4
        list_music_genres
      when 5
        save_music_albums
        break
      else
        puts 'Invalid input'
      end
    end
  end
end
