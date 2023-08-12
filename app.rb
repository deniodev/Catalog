require_relative 'music/genre'
require_relative 'music/music_album'
require_relative 'game/game'
require_relative 'game/game_data'
require_relative 'game/add_game'
require_relative 'game/add_author'
require_relative 'game/author_data'
require 'json'

class App
  def initialize
    @items = []
    @genres = []
    @music_albums = []
    @games = []
    @authors = []
    @file_path = './storage/'.freeze
  end

  def load_data
    unless File.empty?("#{@file_path}music_albums.json")
      @music_albums = JSON.parse(File.read("#{@file_path}music_albums.json"))
    end
    return if File.empty?("#{@file_path}music_genres.json")

    @genres = JSON.parse(File.read("#{@file_path}music_genres.json"))
    @games = GameData.read_data
    @authors = AuthorData.read_data
  end

  def save_music_albums
    File.write("#{@file_path}music_albums.json", @music_albums.to_json)
  end

  def display_menu
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List of games'
    puts '4. List all Labels'
    puts '5. List all Authors'
    puts '6. List all genres'
    puts '7. List all sources'
    puts '8. Add a book'
    puts '9. Add a music album'
    puts '10. Add a game'
    puts '11. Add an author'
    puts '12. exit'
  end

  def process_input(exit: false)
    puts 'Enter your choice:'
    input = gets.chomp.to_i
    case input
    when 1
      puts 'List all books'
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      puts 'List all Labels'
    when 5
      list_author
    when 6
      list_music_genres
    when 7
      puts 'List all sources'
    when 8
      puts 'Add a book'
    when 9
      add_music_album
    when 10
      add_game
    when 11
      add_author
    when 12
      save_music_albums
      GameData.save_data(@games)
      AuthorData.save_data(@authors)
      exit = true
    else
      puts 'Invalid input'
    end
    exit
  end

  def save_music_genres
    File.open("#{@file_path}music_genres.json", 'w') do |f|
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
    @genres.each_with_index { |genre, index| puts "#{index + 1}. #{genre['name']}" }
    input = gets.chomp.to_i
    if input.zero?
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
      next unless saved_genre['name'] == genre

      puts "saved_genre = #{saved_genre}"
      saved_genre['items'] << music_album.as_json
      puts "saved_genre = #{saved_genre['items']}"
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
      break if process_input
    end
  end

  def add_game
    puts 'Creating Game...'
    add_game = AddGame.new
    @games << add_game.create_game
    puts "The game was successfully created!\n\n"
    puts @games
  end

  def list_games
    puts 'No Games Availabe' unless !@games.empty?
    puts 'Listing games...' unless @games.empty?
    @games.each do |game|
      puts game
    end
  end
  def add_author
    puts 'Adding Author...'
    add_author = AddAuthor.new
    @authors << add_author.create_author
    puts "The Author was successfully created!\n\n"
    puts @author
  end

  def list_author
    puts 'No Authors Availabe' unless !@authors.empty?
    puts 'Listing authors...' unless @authors.empty?
    @authors.each do |author|
      puts author
    end
  end
end
